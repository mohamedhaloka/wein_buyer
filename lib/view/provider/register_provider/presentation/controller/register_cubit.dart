import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import 'package:wein_buyer/view/provider/register_provider/data/model/register_model.dart';
import 'package:wein_buyer/view/provider/register_provider/domain/usecases/register.dart';
import '../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../core/location/LocationAddressImports.dart';
import '../../../../../../core/location/location_cubit/location_cubit.dart';
import '../../../../../../core/location/model/location_model.dart';
import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_func.dart';
import '../../../../../../widgets/snackBar.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  final Register registerUseCase;

  static RegisterCubit of(context) => BlocProvider.of(context);
  final formKey = GlobalKey<FormState>();

  final nameStoreController = TextEditingController();
  final nameController = TextEditingController();
  final descStoreController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final aroundMeMinController = TextEditingController(text: '0');
  final aroundMeMaxController = TextEditingController();
  final aroundMePriceController = TextEditingController();
  final localeMinController = TextEditingController();
  final localeMaxController = TextEditingController();
  final localePriceController = TextEditingController();
  final domesticMinController = TextEditingController();
  final domesticMaxController = TextEditingController();
  final domesticPriceController = TextEditingController();

  final LocationCubit locationCubit = LocationCubit();

  onLocationClick(context) async {
    var _loc = await AppFunc.getCurrentLocation(context);
    locationCubit.onLocationUpdated(LocationModel(
      lat: _loc?.latitude ?? 31.037566,
      lng: _loc?.longitude ?? 31.38649,
      address: "",
    ));
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_, animation, __) {
      return FadeTransition(
        opacity: animation,
        child: BlocProvider.value(
          value: locationCubit,
          child: const LocationAddress(),
        ),
      );
    }));
  }

  Future register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoading());
      final res = await registerUseCase.execute(RegisterModel(
        nameStore: nameStoreController.text,
        descStore: descStoreController.text,
        name: nameController.text,
        phone: phoneController.text,
        email: emailController.text,
        address: addressController.text,
        location:
            "${locationCubit.state.model!.lng},${locationCubit.state.model!.lat}",
        password: passwordController.text,
        aroundMeMin: num.parse(aroundMeMinController.text),
        aroundMeMax: num.parse(aroundMeMaxController.text),
        aroundMePrice: num.parse(aroundMePriceController.text),
        localeMin: num.parse(localeMinController.text),
        localeMax: num.parse(localeMaxController.text),
        localePrice: num.parse(localePriceController.text),
        domesticMin: num.parse(domesticMinController.text),
        domesticMax: num.parse(domesticMaxController.text),
        domesticPrice: num.parse(domesticPriceController.text),
      ));
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(RegisterError());
        },
        (res) async {
          emit(RegisterLoaded());
          await AppStorage.cacheUserProviderInfo(res);
          await AppStorage.cacheUserType(0);
          MagicRouter.navigateAndPopAll(BottomNavProviderScreen(
            selectedIndex: 0,
          ));
        },
      );
    }
  }
}
