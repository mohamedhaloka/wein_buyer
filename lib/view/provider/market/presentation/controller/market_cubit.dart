import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/categories_model.dart';
import 'package:wein_buyer/core/models/my_rates_model.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/models/profile_provider_model.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/market/data/model/edit_market_details.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/delete_product.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/edit_market_details.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/getAllCategories.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/getProducts.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/getProfileDataProvider.dart';
import 'package:wein_buyer/view/provider/market/domain/usecases/get_my_rates.dart';
import 'package:wein_buyer/view/provider/market/presentation/widget/edit_header_market_bottom_sheet.dart';
import 'package:wein_buyer/view/provider/market/presentation/widget/edit_location_market_bottom_sheet.dart';
import '../../../../../../core/location/LocationAddressImports.dart';
import '../../../../../../core/location/location_cubit/location_cubit.dart';
import '../../../../../../core/location/model/location_model.dart';
import '../../../../../../core/utils/app_enums.dart';
import '../../../../../../core/utils/app_func.dart';
import '../../../../../../widgets/snackBar.dart';
import '../../../../../core/models/currencies_model.dart';
import '../widget/edit_image_market_bottom_sheet.dart';
import '../widget/edit_market_details_bottom_sheet.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit(
    this.getAllCategoriesUseCase,
    this.getProductsUseCase,
    this.getMyRatesUseCase,
    this.deleteProductUseCase,
    this.editMarketDetailsUseCase,
    this.getProfileDataUseCase,
  ) : super(MarketInitial());

  static MarketCubit of(context) => BlocProvider.of(context);

  final GetAllCategories getAllCategoriesUseCase;
  final GetProducts getProductsUseCase;
  final GetMyRates getMyRatesUseCase;
  final DeleteProduct deleteProductUseCase;
  final EditMarketDetails editMarketDetailsUseCase;
  final GetProfileData getProfileDataUseCase;

  TabMarket tabMarket = TabMarket.marketDetails;

  final LocationCubit locationCubit = LocationCubit();

  final aboutUsController = TextEditingController();
  final radiusController = TextEditingController();
  final titleController = TextEditingController();

  List<CategoryData> listOfCate = [];
  List<ProductData> listOfProduct = [];
  List<Rates> listOfrates = [];
  MyRatesModel? myRatesModel;
  bool? toggleOpenStatusVal;
  File? image, header;
  String? address;
  String? location;
  Profile? profileModel;

  void changeTabButtons(String tab) {
    if (tab == 'details') {
      tabMarket = TabMarket.marketDetails;
    } else if (tab == 'products') {
      tabMarket = TabMarket.sectionsAndProducts;
    }
    emit(ChangeTabButtonsState());
  }

  Future getHeaderData() async {
    emit(GetHeaderDataLoading());
    final res = await getProfileDataUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetHeaderDataError());
      },
      (res) async {
        profileModel = res.body;
        emit(GetHeaderDataLoaded());
      },
    );
  }

  Future getProfileData() async {
    emit(GetProfileDataLoading());
    final res = await getProfileDataUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetProfileDataError());
      },
      (res) async {
        profileModel = res.body;
        emit(GetProfileDataLoaded());
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
        listOfCate.add(CategoryData(
          id: 0,
          name: AppStrings.all.translate(),
          byMe: false,
          active: true,
          isSelected: true,
        ));
        listOfCate.addAll(res.categoryData ?? []);
        emit(MarketInitial());
      },
    );
  }

  Future getProducts(int? cateId) async {
    emit(GetProductsLoading());
    final res = await getProductsUseCase.execute(cateId ?? 0);
    res.fold(
      (err) {
        showSnackBar(err.message);
        print(err.message);
        emit(GetProductsError());
      },
      (res) async {
        listOfProduct.clear();
        listOfProduct.addAll(res.productData ?? []);
        emit(GetProductsLoaded());
      },
    );
  }

  Future getMyRates() async {
    emit(GetMyRatesLoading());
    final res = await getMyRatesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(GetMyRatesError());
      },
      (res) async {
        listOfrates.clear();
        listOfrates.addAll(res.body!.rates ?? []);
        myRatesModel = res;
        emit(GetMyRatesLoaded());
      },
    );
  }

  void onTapOnCategoryItem(int index) {
    getProducts(listOfCate[index].id);
    listOfCate.forEach((element) {
      element.isSelected = false;
    });
    listOfCate[index].isSelected = true;
  }

  Future deleteProduct(int productId) async {
    emit(DeleteProductLoading());
    final res = await deleteProductUseCase.execute(productId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(DeleteProductError());
      },
      (res) async {
        MagicRouter.pop();
        listOfProduct.removeWhere((element) => element.id == productId);
        showSnackBar(AppStrings.deleteProductMsg.translate());
        emit(DeleteProductLoaded());
      },
    );
  }

  editTitleMarket(BuildContext context) async {
    emit(EditMarketDetailsLoading());
    final res = await editMarketDetailsUseCase.execute(
      EditMarketDetailsModel(storeName: titleController.text),
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MarketInitial());
      },
      (res) async {
        titleController.clear();
        MagicRouter.pop();
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return const EditMarketDetailsBottomSheet();
          },
        );
        emit(EditMarketDetailsLoaded());
      },
    );
  }

  editCurrency(BuildContext context, Currency currency) async {
    emit(EditMarketDetailsLoading());
    final res = await editMarketDetailsUseCase.execute(
      EditMarketDetailsModel(currencyId: currency.id),
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MarketInitial());
      },
      (res) async {
        MagicRouter.pop();
        profileModel!.user!.currency = currency;
        emit(EditMarketDetailsLoaded());
      },
    );
  }

  editAboutUs(BuildContext context) async {
    emit(EditMarketDetailsLoading());
    final res = await editMarketDetailsUseCase.execute(
      EditMarketDetailsModel(description: aboutUsController.text),
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MarketInitial());
      },
      (res) async {
        aboutUsController.clear();
        MagicRouter.pop();
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return const EditMarketDetailsBottomSheet();
          },
        );
        emit(EditMarketDetailsLoaded());
      },
    );
  }

  editImageMarket(BuildContext context) async {
    emit(EditMarketDetailsLoading());
    final res = await editMarketDetailsUseCase.execute(
      EditMarketDetailsModel(image: image),
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MarketInitial());
      },
      (res) async {
        MagicRouter.pop();
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return const EditMarketDetailsBottomSheet();
          },
        );
        emit(EditMarketDetailsLoaded());
      },
    );
  }

  editHeaderMarket(BuildContext context) async {
    emit(EditMarketDetailsLoading());
    final res = await editMarketDetailsUseCase.execute(
      EditMarketDetailsModel(header: header),
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MarketInitial());
      },
      (res) async {
        MagicRouter.pop();
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return const EditMarketDetailsBottomSheet();
          },
        );
        emit(EditMarketDetailsLoaded());
      },
    );
  }

  editLocationMarket(BuildContext context) async {
    emit(EditMarketDetailsLoading());
    final res = await editMarketDetailsUseCase.execute(
      EditMarketDetailsModel(address: address, location: location),
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(MarketInitial());
      },
      (res) async {
        MagicRouter.pop();
        showModalBottomSheet<void>(
          context: context,
          isDismissible: false,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          builder: (BuildContext context) {
            return const EditMarketDetailsBottomSheet();
          },
        );
        emit(EditMarketDetailsLoaded());
      },
    );
  }

  Future selectedImageMarket(BuildContext context) async {
    File? image = await AppFunc.getImage();
    if (image != null) {
      this.image = image;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        builder: (BuildContext cont) {
          return BlocProvider.value(
            value: MarketCubit.of(context),
            child: const EditImageMarketBottomSheet(),
          );
        },
      );
      emit(SelectedImageState());
    }
  }

  Future selectedHeaderMarket(BuildContext context) async {
    File? image = await AppFunc.getImage();
    if (image != null) {
      header = image;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        builder: (BuildContext cont) {
          return BlocProvider.value(
            value: MarketCubit.of(context),
            child: const EditHeaderMarketBottomSheet(),
          );
        },
      );
      emit(SelectedHeaderState());
    }
  }

  onLocationClick(BuildContext context) async {
    var _loc = await AppFunc.getCurrentLocation(context);
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 31.037566,
      lng: _loc?.longitude ?? 31.38649,
      address: "",
    ));
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (BuildContext cont) {
        return BlocProvider.value(
          value: MarketCubit.of(context),
          child: const EditLocationMarketBottomSheet(),
        );
      },
    );
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_, animation, __) {
      return FadeTransition(
        opacity: animation,
        child: BlocProvider.value(
          value: locationCubit,
          child: LocationAddress(),
        ),
      );
    }));
  }
}
