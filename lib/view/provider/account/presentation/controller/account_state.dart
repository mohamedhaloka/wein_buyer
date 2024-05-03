part of 'account_cubit.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}
class ContactUsLoaded extends AccountState {}
class ContactUsLoading extends AccountState {}
class ContactUsError extends AccountState {}
