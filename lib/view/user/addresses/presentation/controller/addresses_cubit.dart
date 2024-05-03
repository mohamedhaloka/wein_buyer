import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/add_address.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/delete_address.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/edit_address.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/get_addresses.dart';
import 'package:wein_buyer/view/user/addresses/domain/usecases/make_default_address.dart';
import '../../../../../../../core/location/LocationAddressImports.dart';
import '../../../../../../../core/location/location_cubit/location_cubit.dart';
import '../../../../../../../core/location/model/location_model.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_func.dart';
import '../../../../../../../widgets/snackBar.dart';
import '../../../../select_user/presentation/screens/select_user_screen.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  AddressesCubit(
      this.addAddressUseCase,
      this.getAddressesUseCase,
      this.editAddressUseCase,
      this.deleteAddressUseCase,
      this.makeDefaultAddressUseCase)
      : super(AddressesInitial());

  static AddressesCubit of(context) => BlocProvider.of(context);

  final AddAddress addAddressUseCase;
  final EditAddress editAddressUseCase;
  final DeleteAddress deleteAddressUseCase;
  final MakeDefaultAddress makeDefaultAddressUseCase;
  final GetAddresses getAddressesUseCase;

  final LocationCubit locationCubit = LocationCubit();

  final formKey = GlobalKey<FormState>();

  final recipientNameController = TextEditingController();
  final nearestAddressController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();

  List<Address> listOfAddress = [];

  setData(Address address) {
    recipientNameController.text = address.recipientName ?? "";
    phoneController.text = address.phone ?? "";
    addressController.text = address.address ?? "";
    nearestAddressController.text = address.nearestAddress ?? "";
    locationCubit.onLocationUpdated(LocationModel(
      lng: double.parse(address.lng ?? '0.0'),
      lat: double.parse(address.lat ?? '0.0'),
      address: address.address ?? '',
    ));
  }

  void onSelectedAddressItemDefault(int addressId) async {
    final res = await makeDefaultAddressUseCase.execute(addressId: addressId);
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(OnSelectedAddressItemDefaultError());
      },
      (res) async {
        for (var element in listOfAddress) {
          element.isDefault = false;
        }
        listOfAddress.firstWhere((element) => element.id == res.id).isDefault =
            true;
        emit(OnSelectedAddressItemDefaultState());
      },
    );
  }

  Future getAddresses() async {
    listOfAddress.clear();
    emit(GetAddressesLoading());
    final res = await getAddressesUseCase.execute();
    res.fold(
      (err) {
        showSnackBar(
          err.errorMessageModel.message ?? '',
          pleaseLogin: err.errorMessageModel.errorCode == 2 ? true : false,
        );
        emit(GetAddressesError());
      },
      (res) async {
        listOfAddress.addAll(res.address ?? []);
        emit(GetAddressesLoaded());
      },
    );
  }

  Future addAddress() async {
    if (formKey.currentState!.validate() &&
        recipientNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        nearestAddressController.text.isNotEmpty) {
      emit(AddAddressLoading());
      final res = await addAddressUseCase.execute(
        lng: locationCubit.state.model!.lng,
        lat: locationCubit.state.model!.lat,
        address: locationCubit.state.model!.address,
        recipientName: recipientNameController.text,
        nearestAddress: nearestAddressController.text,
        phone: phoneController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(AddAddressError());
        },
        (res) async {
          MagicRouter.pop();
          listOfAddress.add(res);
          emit(AddAddressLoaded());
        },
      );
    }
  }

  Future editAddress(int addressId) async {
    if (formKey.currentState!.validate() &&
        recipientNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        nearestAddressController.text.isNotEmpty) {
      emit(EditAddressLoading());
      final res = await editAddressUseCase.execute(
        addressId: addressId,
        lng: locationCubit.state.model!.lng,
        lat: locationCubit.state.model!.lat,
        address: locationCubit.state.model!.address,
        recipientName: recipientNameController.text,
        nearestAddress: nearestAddressController.text,
        phone: phoneController.text,
      );
      res.fold(
        (err) {
          showSnackBar(err.message);
          emit(EditAddressError());
        },
        (res) async {
          listOfAddress.removeWhere((element) => element.id == res.id);
          listOfAddress.add(res);
          MagicRouter.pop();
          emit(EditAddressLoaded());
        },
      );
    }
  }

  Future deleteAddress(int addressId) async {
    final res = await deleteAddressUseCase.execute(
      addressId: addressId,
    );
    res.fold(
      (err) {
        showSnackBar(err.message);
        emit(DeleteAddressError());
      },
      (res) async {
        showSnackBar(AppStrings.deleteAddressMsg.translate());
        listOfAddress.removeWhere((element) => element.id == addressId);
        emit(DeleteAddressLoaded());
      },
    );
  }

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
}
