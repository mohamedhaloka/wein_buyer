part of 'register_cubit.dart';

@immutable
abstract class RegisterUserState {}

class RegisterInitial extends RegisterUserState {}

class RegisterLoading extends RegisterUserState {}

class RegisterLoaded extends RegisterUserState {}
class RegisterError extends RegisterUserState {}
