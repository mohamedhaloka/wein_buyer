part of 'edit_profile_cubit.dart';

@immutable
abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {}

class GetProfileLoading extends EditProfileState {}

class GetProfileLoaded extends EditProfileState {}

class GetProfileError extends EditProfileState {}

class SelectedImageProfile extends EditProfileState {}
class ChangeGenderProfile extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileLoaded extends EditProfileState {}

class EditProfileError extends EditProfileState {}

class EditPasswordLoading extends EditProfileState {}

class EditPasswordLoaded extends EditProfileState {}

class EditPasswordError extends EditProfileState {}
