part of 'section_cubit.dart';

@immutable
abstract class SectionState {}

class SectionInitial extends SectionState {}

class GetMainCatesLoaded extends SectionState {}

class GetMainCatesLoading extends SectionState {}

class GetMainCatesError extends SectionState {}

class GetSubCatesLoaded extends SectionState {}

class GetSubCatesLoading extends SectionState {}

class GetSubCatesError extends SectionState {}
class OnTapOnCategoryItemState extends SectionState {}
class OnTapOnCategoryItemLoading extends SectionState {}
