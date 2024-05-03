part of 'utils_cubit.dart';

@immutable
abstract class UtilsState {}

class UtilsInitial extends UtilsState {}

class GetSizesError extends UtilsState {}
class GetSizesLoaded extends UtilsState {}

class GetVerifiedStatusError extends UtilsState {}
class GetVerifiedStatusLoaded extends UtilsState {}
class GetVerifiedStatusLoading extends UtilsState {}
