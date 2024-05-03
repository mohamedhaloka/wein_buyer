part of 'size_guide_cubit.dart';

@immutable
abstract class SizeGuideState {}

class SizeGuideInitial extends SizeGuideState {}

class GetSizeGuideLoaded extends SizeGuideState {}

class GetSizeGuideLoading extends SizeGuideState {}

class GetSizeGuideError extends SizeGuideState {}

class AddSizeGuideLoaded extends SizeGuideState {}

class AddSizeGuideLoading extends SizeGuideState {}

class AddSizeGuideError extends SizeGuideState {}

class EditSizeGuideLoaded extends SizeGuideState {}

class EditSizeGuideLoading extends SizeGuideState {}

class EditSizeGuideError extends SizeGuideState {}

class DeleteSizeGuideLoaded extends SizeGuideState {}

class DeleteSizeGuideLoading extends SizeGuideState {}

class DeleteSizeGuideError extends SizeGuideState {}

class SelectedImageState extends SizeGuideState {}
