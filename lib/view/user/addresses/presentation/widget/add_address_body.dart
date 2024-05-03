import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/location/location_cubit/location_cubit.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/validator/validator.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/addresses_cubit.dart';

class AddAddressBody extends StatelessWidget {
  AddAddressBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(20),
        horizontal: AppSizes.getProportionateScreenWidth(30),
      ),
      child: SingleChildScrollView(
        child: Form(
          key: AddressesCubit.of(context).formKey,
          child: Column(
            children: [
              SizedBox(
                width: AppSizes.screenWidth,
                height: AppSizes.getProportionateScreenHeight(170),
                child: Stack(
                  children: [
                    Image.asset(
                      AppAssets.map_img,
                    ),
                    Container(
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          AddressesCubit.of(context).onLocationClick(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: AppSizes.getProportionateScreenHeight(10),
                            horizontal: AppSizes.getProportionateScreenWidth(20),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          child: Text(
                            AppStrings.chooseAddress.translate(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SpaceH(inputHeigth: 20),
              InputFormField(
                hint: AppStrings.userName.translate(),
                icon: Icons.person_outline,
                fillColor: Colors.white,
                controller: AddressesCubit.of(context).recipientNameController,
                validator: (value)=> Validator.generalField(value),
              ),
              SpaceH(inputHeigth: 10),
              InputFormField(
                hint: AppStrings.phone.translate(),
                icon: Icons.phone_android,
                fillColor: Colors.white,
                isNumber: true,
                controller: AddressesCubit.of(context).phoneController,
                validator: (value)=> Validator.phoneNumber(value),
              ),
              SpaceH(inputHeigth: 10),
              BlocConsumer<LocationCubit, LocationState>(
                bloc: AddressesCubit.of(context).locationCubit,
                listener: (context, state) {
                  AddressesCubit.of(context).addressController.text =
                      state.model!.address;
                },
                builder: (context, state) {
                  return InputFormField(
                    hint: AppStrings.addressesScreen.translate(),
                    icon: Icons.location_on_outlined,
                    fillColor: Colors.white,
                    clickable: true,
                    controller: AddressesCubit.of(context).addressController,
                    validator: (value)=> Validator.generalField(value),
                  );
                },
              ),
              SpaceH(inputHeigth: 10),
              InputFormField(
                hint: AppStrings.nearAddressOrderWidget.translate(),
                icon: Icons.flag_outlined,
                fillColor: Colors.white,
                controller: AddressesCubit.of(context).nearestAddressController,
                validator: (value)=> Validator.generalField(value),
              ),
              SpaceH(inputHeigth: 60),
            ],
          ),
        ),
      ),
    );
  }
}
