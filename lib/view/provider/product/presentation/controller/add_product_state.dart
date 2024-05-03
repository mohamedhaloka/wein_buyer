part of 'add_product_cubit.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductError extends AddProductState {}

class AddProductLoading extends AddProductState {}

class GetAllCategoriesLoading extends AddProductState {}

class GetAllCategoriesError extends AddProductState {}

class GetSubCategoriesLoading extends AddProductState {}

class GetSubCategoriesError extends AddProductState {}

class GetSubCategoriesLoaded extends AddProductState {}

class OnSelectMainCateItem extends AddProductState {}

class OnSelectSubCateItem extends AddProductState {}

class SelectListOfImage extends AddProductState {}

class SelectListOfImageNetwork extends AddProductState {}

class AddAnotherProperty extends AddProductState {}

class CalcuDescount extends AddProductState {}

class OnChangeColors extends AddProductState {}

class EditProductLoading extends AddProductState {}

class EditProductError extends AddProductState {}

class DeleteImageLoaded extends AddProductState {}
