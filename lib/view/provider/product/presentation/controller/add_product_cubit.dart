import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/property_model.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import 'package:wein_buyer/view/provider/product/domain/usecases/add_product.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/getSubCategories.dart';
import '../../../../../../core/models/categories_model.dart';
import '../../../../../../core/models/add_product_model.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../../../../core/models/products_provider_model.dart';
import '../../../../../core/models/sub_categories_provider_model.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../market/domain/usecases/getAllCategories.dart';
import '../../domain/usecases/delete_image.dart';
import '../../domain/usecases/edit_product.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(
      this.addProductUseCase,
      this.getAllCategoriesUseCase,
      this.getSubCategoriesUseCase,
      this.editProductUseCase,
      this.deleteImageUseCase)
      : super(AddProductInitial());

  static AddProductCubit of(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();

  final DeleteImage deleteImageUseCase;
  final AddProduct addProductUseCase;
  final EditProduct editProductUseCase;
  final GetAllCategories getAllCategoriesUseCase;
  final GetSubCategories getSubCategoriesUseCase;

  final categoryController = TextEditingController();
  final subCategoryController = TextEditingController();
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final priceController = TextEditingController();
  final discountController = TextEditingController();
  final priceAfterDiscountController = TextEditingController();
  final quantityController = TextEditingController();

  List<File> listOfImages = [];
  List<Files> listOfImagesNetwork = [];

  List<CategoryData> listOfCate = [];
  List<SubCategoryData> listOfSubCate = [];

  List<PropertyModel> listOfProperty = [];

  int? selectedSubCateId;

  ProductData? productData;

  String? selectedSize;

  initData(context, ProductData productData) async {
    await getAllCategories();
    setData(context, productData);
  }

  onChangeSizes(int index, String size) {
    listOfProperty[index].size = size;
    emit(OnChangeColors());
  }

  onChangeColors(int index, String color) {
    listOfProperty[index].colorController!.text = color;
    emit(OnChangeColors());
  }

  Future<void> selectListOfImage(BuildContext context) async {
    final images = await AppFunc.getMedias(context);
    listOfImages.addAll(images);
    emit(SelectListOfImage());
  }

  clearImageItem(int index) {
    listOfImages.removeAt(index);
    emit(SelectListOfImage());
  }

  onSelectSubCateItem(int index) {
    for (var element in listOfSubCate) {
      element.isSelected = false;
    }
    listOfSubCate[index].isSelected = true;
    selectedSubCateId = listOfSubCate[index].id;
    subCategoryController.text = listOfSubCate[index].name ?? '';
    emit(OnSelectSubCateItem());
  }

  onSelectMainCateItem(int index) async {
    for (var element in listOfCate) {
      element.isSelected = false;
    }
    listOfCate[index].isSelected = true;
    categoryController.text = listOfCate[index].name ?? '';
    await getSubCategories(listOfCate[index].id!);
    emit(OnSelectMainCateItem());
  }

  Future getSubCategories(int cateId) async {
    emit(GetSubCategoriesLoading());
    final res = await getSubCategoriesUseCase.execute(cateId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetSubCategoriesError());
      },
      (res) async {
        listOfSubCate.clear();
        listOfSubCate.addAll(res.categoryData ?? []);
        emit(GetSubCategoriesLoaded());
      },
    );
  }

  Future getAllCategories() async {
    emit(GetAllCategoriesLoading());
    final res = await getAllCategoriesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetAllCategoriesError());
      },
      (res) async {
        listOfCate.clear();
        listOfCate.addAll(res.categoryData ?? []);
        emit(AddProductInitial());
      },
    );
  }

  addAnotherProperty() {
    listOfProperty.add(PropertyModel(
      colorController: TextEditingController(),
      size: '',
      quantityController: TextEditingController(),
    ));
    emit(AddAnotherProperty());
  }

  clearProperty(int index) {
    listOfProperty.removeAt(index);
    emit(AddAnotherProperty());
  }

  calcuDiscount(String discount) {
    if (discount.isNotEmpty) {
      priceAfterDiscountController.text = (num.parse(priceController.text) -
              (num.parse(priceController.text) * (num.parse(discount) / 100)))
          .toString();
    } else {
      priceAfterDiscountController.text = '';
    }
    emit(CalcuDescount());
  }

  Future addProduct(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (categoryController.text.isNotEmpty &&
          subCategoryController.text.isNotEmpty) {
        if (listOfImages.isNotEmpty) {
          emit(AddProductLoading());
          final res = await addProductUseCase.execute(AddProductModel(
            categoryId: selectedSubCateId ?? 0,
            name: nameController.text,
            description: descController.text,
            images: listOfImages,
            price: num.parse(priceController.text),
            discount: discountController.text.isEmpty
                ? null
                : num.parse(discountController.text),
            listOfProperties: listOfProperty,
          ));
          res.fold(
            (err) {
              showSnackBar(err.message);
              emit(AddProductError());
            },
            (res) async {
              if (res.success = true) {
                showSnackBar(AppStrings.addProductMsg.translate());
                MagicRouter.navigateAndPopAll(
                    BottomNavProviderScreen(selectedIndex: 1));
              }
              emit(AddProductInitial());
            },
          );
        } else {
          showSnackBar(AppStrings.addImages.translate());
        }
      } else {
        showSnackBar(AppStrings.cateProductValidation.translate());
      }
    } else {
      showSnackBar(AppStrings.infoProductValidation.translate());
    }
  }

  /// Edit
  setData(BuildContext context, ProductData productData) async {
    this.productData = productData;
    nameController.text = productData.name ?? '';
    descController.text = productData.description ?? '';
    priceController.text = productData.price.toString();
    discountController.text = productData.discount.toString();
    priceAfterDiscountController.text =
        productData.priceAfterDiscount.toString();
    setImageNetowkInUi();

    int selectedCat = listOfCate
        .indexWhere((element) => element.id == productData.parentCategory!.id);
    await onSelectMainCateItem(selectedCat);

    int selectedSubCat = listOfSubCate
        .indexWhere((element) => element.id == productData.category!.id);
    onSelectSubCateItem(selectedSubCat);

    /// cate
    /// subCate
    /// check delete image

    for (var element in productData.properties!) {
      setAnotherProperty(PropertyModel(
        size: element.size,
        colorController: TextEditingController(text: element.color),
        quantityController: TextEditingController(text: element.quantity.toString()),
      ));
    }
  }

  setImageNetowkInUi() {
    listOfImagesNetwork.addAll(productData!.files ?? []);
    emit(SelectListOfImageNetwork());
  }

  setAnotherProperty(PropertyModel propertyModel) {
    listOfProperty.add(propertyModel);
    emit(AddAnotherProperty());
  }

  Future deleteImage(String imgUrl) async {
    final res = await deleteImageUseCase.execute(productData!.id!, imgUrl);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddProductInitial());
      },
      (res) async {
        showSnackBar(AppStrings.deleteImageMsg.translate());
        listOfImagesNetwork.removeWhere((element) => element.file == imgUrl);
        emit(DeleteImageLoaded());
      },
    );
  }

  Future editProduct(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (categoryController.text.isNotEmpty &&
          subCategoryController.text.isNotEmpty) {
        if (productData!.images!.isNotEmpty) {
          emit(EditProductLoading());
          final res = await editProductUseCase.execute(
            AddProductModel(
              categoryId: selectedSubCateId ?? 0,
              name: nameController.text,
              description: descController.text,
              images: listOfImages,
              price: num.parse(priceController.text),
              discount: discountController.text.isEmpty
                  ? null
                  : num.parse(discountController.text),
              listOfProperties: listOfProperty,
            ),
            productData!.id!,
          );
          res.fold(
            (err) {
              showSnackBar(err.message);
              emit(EditProductError());
            },
            (res) async {
              if (res.success = true) {
                showSnackBar(AppStrings.editProductMsg.translate());
                MagicRouter.navigateAndPopAll(
                    BottomNavProviderScreen(selectedIndex: 1));
              }
              emit(AddProductInitial());
            },
          );
        } else {
          showSnackBar(AppStrings.addImages.translate());
        }
      } else {
        showSnackBar(AppStrings.cateProductValidation.translate());
      }
    } else {
      showSnackBar(AppStrings.infoProductValidation.translate());
    }
  }
}
