part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninSuccess extends SigninState {
  final UserEntity user;

  SigninSuccess({required this.user});
}

final class SigninLoading extends SigninState {}

final class SigninFailure extends SigninState {
  final String errorMsg;

  SigninFailure({required this.errorMsg});
}
