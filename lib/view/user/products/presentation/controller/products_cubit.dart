import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/product.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_all_free_delivery.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_all_offers.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_product_by_sort_filter.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_product_by_sort_max_and_min.dart';
import 'package:wein_buyer/view/user/products/domain/usecases/get_product_by_sub_category.dart';

import '../../../../../../../core/models/sort_model.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../core/utils/app_strings.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(
      this.getProductBySubCategoryUseCase,
      this.getProductBySortFilterUseCase,
      this.getProductBySortMaxAndMinUseCase,
      this.getAllOffersUseCase,
      this.getAllFreeDeliveryUseCase)
      : super(ProductsInitial());

  static ProductsCubit of(context) => BlocProvider.of(context);

  final scrollControllerOffer = ScrollController();
  final scrollControllerFreeDelivery = ScrollController();

  final GetProductBySubCategory getProductBySubCategoryUseCase;
  final GetProductBySortFilter getProductBySortFilterUseCase;
  final GetProductBySortMaxAndMin getProductBySortMaxAndMinUseCase;
  final GetAllOffers getAllOffersUseCase;
  final GetAllFreeDelivery getAllFreeDeliveryUseCase;

  List<SortModel> listOfSortModel = [
    SortModel('latest', AppStrings.latest.translate(), false),
    SortModel('nearest', AppStrings.nearest.translate(), false),
    SortModel('top_rated', AppStrings.topRated.translate(), false),
    SortModel('lowest_price', AppStrings.lowestPrice.translate(), false),
    SortModel('highest_price', AppStrings.highestPrice.translate(), false),
  ];

  List<Product> listOfProducts = [];
  List<Product> listOfOffers = [];
  List<Product> listOfFreeDelivery = [];

  void onTapOnSortItem({required int index, required int subCateId}) {
    listOfSortModel.forEach((element) {
      element.isSelected = false;
    });
    listOfSortModel[index].isSelected = true;
    MagicRouter.pop();
    getProductBySort(subCateId, listOfSortModel[index].key);
    emit(OnTapOnSortItemState());
  }

  Future getAllFreeDelivery({required bool firstFetch}) async {
    int page = 1;
    if(firstFetch == true){
      page = 1;
      listOfFreeDelivery = [];
      emit(GetAllFreeDeliveryLoading());
    }
    final res = await getAllFreeDeliveryUseCase.execute(page);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetAllFreeDeliveryError());
      },
      (res) async {
        if (res.body!.isNotEmpty) {
          listOfFreeDelivery.addAll(res.body ?? []);
          emit(GetAllFreeDeliveryLoaded());
          page++;
        }
      },
    );
  }

  Future getAllOffers({required bool firstFetch}) async {
    int page = 1;
    if (firstFetch == true) {
      page = 1;
      listOfOffers = [];
      emit(GetAllOffersLoading());
    }
    final res = await getAllOffersUseCase.execute(page);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetAllOffersError());
      },
      (res) async {
        if (res.body!.isNotEmpty) {
          listOfOffers.addAll(res.body ?? []);
          emit(GetAllOffersLoaded());
          page++;
        }
      },
    );
  }

  Future getProductBySortMaxAndMin(int subCateId, String maxPrice,
      String minPrice, String minDistance, String maxDistance) async {
    listOfProducts.clear();
    emit(GetProductsLoading());
    MagicRouter.pop();
    final res = await getProductBySortMaxAndMinUseCase.execute(
        subCateId, maxPrice, minPrice, minDistance, maxDistance);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProductsError());
      },
      (res) async {
        listOfProducts.addAll(res.body ?? []);
        emit(GetProductsLoaded());
      },
    );
  }

  Future getProductBySort(int subCateId, String keyOfFilter) async {
    listOfProducts.clear();
    emit(GetProductsLoading());
    final res =
        await getProductBySortFilterUseCase.execute(subCateId, keyOfFilter);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProductsError());
      },
      (res) async {
        listOfProducts.addAll(res.body ?? []);
        emit(GetProductsLoaded());
      },
    );
  }

  Future getProductBySubCategory(int subCateId) async {
    listOfProducts.clear();
    emit(GetProductsLoading());
    final res = await getProductBySubCategoryUseCase.execute(subCateId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProductsError());
      },
      (res) async {
        listOfProducts.addAll(res.body ?? []);
        emit(GetProductsLoaded());
      },
    );
  }
}
