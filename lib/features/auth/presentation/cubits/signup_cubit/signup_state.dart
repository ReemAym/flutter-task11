part of 'signup_cubit.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccess extends SignupState {
  final UserEntity user;

  SignupSuccess({required this.user});
}

final class SignupFailure extends SignupState {
  final String errorMsg;

  SignupFailure({required this.errorMsg});
}

final class SignupLoading extends SignupState {}
