import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());

  final AuthRepo authRepo;

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    emit(SigninLoading());

    var result = await authRepo.signInWithEmailAndPassword(
        email: email, password: password);

    result.fold(
        (Failure) => emit(
              SigninFailure(errorMsg: Failure.message),
            ),
        (user) => emit(SigninSuccess(user: user)));
  }

  Future<void> signInWithGoogle() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (Failure) => emit(
        SigninFailure(errorMsg: Failure.message),
      ),
      (user) => emit(SigninSuccess(user: user)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
      (Failure) => emit(
        SigninFailure(errorMsg: Failure.message),
      ),
      (user) => emit(SigninSuccess(user: user)),
    );
  }

  Future<void> signInWithApple() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithApple();
    result.fold(
      (Failure) => emit(SigninFailure(errorMsg: Failure.message)),
      (user) => emit(SigninSuccess(user: user)),
    );
  }
}
