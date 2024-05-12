import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../../core/models/categories_item_model.dart';
import '../../../../../../../core/models/market_details_model.dart';
import '../../../../../../../core/models/product.dart';
import '../../../../../../../core/models/product_details.dart';
import '../../../../../../../core/utils/app_enums.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../domain/usecases/add_to_cart.dart';
import '../../domain/usecases/get_market_categories.dart';
import '../../domain/usecases/get_market_details.dart';
import '../../domain/usecases/get_market_products.dart';
import '../../domain/usecases/get_product_details.dart';
import '../../domain/usecases/get_related_products.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(
      this.getProductDetailsUseCase,
      this.getRelatedProductsUseCase,
      this.addToCartUseCase,
      this.getMarketDetailsUseCase,
      this.getMarketCategoriesUseCase,
      this.getMarketProductsUseCase)
      : super(ProductDetailsInitial());

  static ProductDetailsCubit of(context) => BlocProvider.of(context);

  final GetProductDetails getProductDetailsUseCase;
  final GetRelatedProducts getRelatedProductsUseCase;
  final AddToCart addToCartUseCase;
  final GetMarketDetails getMarketDetailsUseCase;
  final GetMarketCategories getMarketCategoriesUseCase;
  final GetMarketProducts getMarketProductsUseCase;

  ProductDetails? productDetailsModel;
  List<Product> listOfProduct = [];
  int quantity = 1;
  MarketDetails? marketDetails;
  List<CategoriesItem> listOfCates = [];
  List<Product> listOfProductsOfCategories = [];
  int selectedCategory = 0;

  int selectedItemColor = 0;
  int selectedItemSize = 0;

  TabMarket tabMarket = TabMarket.marketDetails;

  void changeTabButtons(String tab) {
    if (tab == 'details') {
      tabMarket = TabMarket.marketDetails;
    } else if (tab == 'products') {
      tabMarket = TabMarket.sectionsAndProducts;
    }
    emit(ChangeTabButtonsState());
  }

  Future getMarketProducts(int index, int marketId, int categoryId) async {
    listOfProductsOfCategories.clear();
    selectedCategory = index;
    emit(GetMarketProductsLoading());
    final res = await getMarketProductsUseCase.execute(marketId, categoryId);
    res.fold(
      (err) {
        // showSnackBar(err.message);
        emit(GetMarketProductsError());
      },
      (res) async {
        listOfProductsOfCategories.addAll(res.body ?? []);
        emit(GetMarketProductsLoaded());
      },
    );
  }

  Future getMarketCategories(int marketId) async {
    emit(GetMarketCategoriesLoading());
    final res = await getMarketCategoriesUseCase.execute(marketId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetMarketCategoriesError());
      },
      (res) async {
        listOfCates.clear();
        listOfCates.add(CategoriesItem(
          id: 0,
          name: AppStrings.all.translate(),
          image: '',
        ));
        listOfCates.addAll(res.body ?? []);
        emit(GetMarketCategoriesLoaded());
      },
    );
  }

  Future getMarketDetails(int marketId) async {
    emit(GetMarketDetailsLoading());
    final res = await getMarketDetailsUseCase.execute(marketId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetMarketDetailsError());
      },
      (res) async {
        marketDetails = res;
        emit(GetMarketDetailsLoaded());
      },
    );
  }

  Future addToCart(int productId, int quantity, double lat, double lng) async {
    emit(AddToCartLoading());
    final res = await addToCartUseCase.execute(
        productId,
        quantity,
        productDetailsModel!.product!.propertiesMap!.color!.isEmpty
            ? ''
            : productDetailsModel!
                .product!.propertiesMap!.color![selectedItemColor],
        productDetailsModel!.product!.propertiesMap!.size!.isEmpty
            ? ''
            : productDetailsModel!
                .product!.propertiesMap!.size![selectedItemSize],
        lat,
        lng);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(AddToCartError());
      },
      (res) async {
        showSnackBar('تم اضافه المنتج في السله');
        emit(AddToCartLoaded());
      },
    );
  }

  Future getRelatedProducts(int productId) async {
    emit(GetRelatedProductsLoading());
    final res = await getRelatedProductsUseCase.execute(productId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetRelatedProductsError());
      },
      (res) async {
        listOfProduct.addAll(res.body ?? []);
        emit(GetRelatedProductsLoaded());
      },
    );
  }

  Future getProductDetails(int productId) async {
    emit(GetProductDetailsLoading());
    final res = await getProductDetailsUseCase.execute(productId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProductDetailsError());
      },
      (res) async {
        productDetailsModel = res;
        emit(GetProductDetailsLoaded());
      },
    );
  }

  increaseQuantity() {
    quantity++;
    emit(IncreaseQuantityState());
  }

  decreaseQuantity() {
    if (quantity > 1) {
      quantity--;
    }
    emit(DecreaseQuantityState());
  }
}
