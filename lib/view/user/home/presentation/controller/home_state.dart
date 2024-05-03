part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class GetHomeDataLoaded extends HomeState {}
class GetHomeDataLoading extends HomeState {}
class GetHomeDataError extends HomeState {}
