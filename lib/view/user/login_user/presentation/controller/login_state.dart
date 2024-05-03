part of 'login_cubit.dart';

@immutable
abstract class LoginUserState {}

class LoginInitial extends LoginUserState {}

class LoginLoading extends LoginUserState {}

class LoginLoaded extends LoginUserState {}

class LoginError extends LoginUserState {}
