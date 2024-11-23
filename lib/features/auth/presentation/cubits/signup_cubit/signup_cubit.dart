import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(
        email: email, name: name, password: password);
    result.fold(
      (failure) => emit(SignupFailure(errorMsg: failure.message)),
      (userEntity) => emit(SignupSuccess(user: userEntity)),
    );
  }
}
