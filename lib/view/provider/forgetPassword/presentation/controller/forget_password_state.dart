part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordLoaded extends ForgetPasswordState {}

class ForgetPasswordError extends ForgetPasswordState {}

class VerificationCodeLoading extends ForgetPasswordState {}

class VerificationCodeLoaded extends ForgetPasswordState {}

class VerificationCodeError extends ForgetPasswordState {}


class ChangePasswordLoading extends ForgetPasswordState {}

class ChangePasswordLoaded extends ForgetPasswordState {}

class ChangePasswordError extends ForgetPasswordState {}

