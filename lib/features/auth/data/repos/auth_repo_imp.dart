import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/error/custom_exceptions.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/services/database_service.dart';
import 'package:e_commerce_app/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce_app/core/utils/backend_endpoint.dart';
import 'package:e_commerce_app/features/auth/data/models/user_model.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/firebase_auth_service.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImp(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUderWithEmailAndPassword(
          email: email, password: password);

      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('exception in AuthRepoImp.createUserWithEmailAndPassword  ${e.toString()}');

      return left(ServerFailure(message: "حدث خطأ في عملية انشاء الحساب"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);

      var userEntity = await getUserData(uid: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('exception in AuthRepoImp.signInWithEmailAndPassword  ${e.toString()}');

      return left(ServerFailure(message: "حدث خطأ في عملية تسجيل الدخول"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      var userExit = await databaseService.checkIfDataExit(
        documentid: user.uid,
        path: BackendEndPoint.isUserExit,
      );

      if (userExit) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    }
    // on CustomExceptions catch (e) {
    //   return left(ServerFailure(message: e.message));
    // }
    catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('exception in AuthRepoImp.signInWithGoogle  ${e.toString()}');
      return left(ServerFailure(message: "حدث خطأ في عملية تسجيل الدخول"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      var userExit = await databaseService.checkIfDataExit(
        documentid: user.uid,
        path: BackendEndPoint.isUserExit,
      );

      if (userExit) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('exception in AuthRepoImp.signInWithFacebook  ${e.toString()}');
      return left(ServerFailure(message: "حدث خطأ في عملية تسجيل الدخول"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithApple();
      var userEntity = UserModel.fromFirebaseUser(user);
      await saveUserData(user: userEntity);

      var userExit = await databaseService.checkIfDataExit(
        documentid: user.uid,
        path: BackendEndPoint.isUserExit,
      );

      if (userExit) {
        await getUserData(uid: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('exception in AuthRepoImp.signInWithApple  ${e.toString()}');
      return left(ServerFailure(message: "حدث خطأ في عملية تسجيل الدخول"));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndPoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentid: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    var data = await databaseService.getData(
        path: BackendEndPoint.getUserData, documentid: uid);

    return UserModel.fromJson(data);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await SharedPreferencesSingleton.setString(KUserData, jsonData);
  }
}
