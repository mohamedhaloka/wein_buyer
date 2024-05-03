part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordUserState {}

class ForgetPasswordInitial extends ForgetPasswordUserState {}

class ForgetPasswordLoading extends ForgetPasswordUserState {}

class ForgetPasswordLoaded extends ForgetPasswordUserState {}

class ForgetPasswordError extends ForgetPasswordUserState {}

class VerificationCodeLoading extends ForgetPasswordUserState {}

class VerificationCodeLoaded extends ForgetPasswordUserState {}

class VerificationCodeError extends ForgetPasswordUserState {}


class ChangePasswordLoading extends ForgetPasswordUserState {}

class ChangePasswordLoaded extends ForgetPasswordUserState {}

class ChangePasswordError extends ForgetPasswordUserState {}

