import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/models/category.dart';
import 'package:wein_buyer/core/models/product.dart';
import 'package:wein_buyer/view/user/section/domain/usecases/get_main_cates.dart';
import 'package:wein_buyer/view/user/section/domain/usecases/get_sub_cates_and_top_rated_products.dart';

import '../../../../../../../widgets/snackBar.dart';

part 'section_state.dart';

class SectionCubit extends Cubit<SectionState> {
  SectionCubit(
      this.getMainCatesUseCase, this.getSubCatesAndTopRatedProductsUseCase)
      : super(SectionInitial());

  static SectionCubit of(context) => BlocProvider.of(context);

  final GetMainCates getMainCatesUseCase;
  final GetSubCatesAndTopRatedProducts getSubCatesAndTopRatedProductsUseCase;

  List<Category> listOfMainCates = [];
  List<Category> listOfSubCates = [];
  List<Product> listOfTopRatedProducts = [];

  void onTapOnCategoryItem(int index) {
    emit(OnTapOnCategoryItemLoading());
    listOfMainCates.forEach((element) {
      element.isSelected = false;
    });
    listOfMainCates[index].isSelected = true;
    getSubCatesAndTopRatedProducts(listOfMainCates
        .firstWhere((element) => element.isSelected == true)
        .id!);
    emit(OnTapOnCategoryItemState());
  }

  Future getSubCatesAndTopRatedProducts(int cateId) async {
    listOfSubCates.clear();
    listOfTopRatedProducts.clear();
    emit(GetSubCatesLoading());
    final res = await getSubCatesAndTopRatedProductsUseCase.execute(cateId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetSubCatesError());
      },
      (res) async {
        listOfSubCates.addAll(res.body!.subCategories ?? []);
        listOfTopRatedProducts.addAll(res.body!.topRatedProducts ?? []);
        emit(GetSubCatesLoaded());
      },
    );
  }

  Future getMainCates({required int cateId}) async {
    emit(GetMainCatesLoading());
    final res = await getMainCatesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetMainCatesError());
      },
      (res) async {
        listOfMainCates.addAll(res.body ?? []);
        emit(GetMainCatesLoaded());
        listOfMainCates.firstWhere((element) => element.id == cateId).isSelected = true;
        getSubCatesAndTopRatedProducts(listOfMainCates.firstWhere((element) => element.isSelected == true).id!);
      },
    );
  }
}
