import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/location/location_cubit/location_cubit.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../core/validator/validator.dart';
import '../../../../../../widgets/input_form_field.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/register_cubit.dart';
import 'delivery_cost_widget.dart';
import 'register_action.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizes.screenHeight * 0.25,
          child: Stack(
            children: [
              Container(
                width: AppSizes.screenWidth,
                height: AppSizes.screenHeight * 0.25,
                color: AppColors.primaryColor,
                child: Image.asset(
                  AppAssets.logo,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: AppSizes.screenHeight * 0.025,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            // height: AppSizes.screenHeight * 0.7,
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Text(
                  AppStrings.registerBody.translate(),
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SpaceH(inputHeigth: 15),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: RegisterCubit.of(context).formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputFormField(
                            hint: AppStrings.shopNameRegisterBody.translate(),
                            icon: FontAwesomeIcons.store,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            validator: Validator.generalField,
                            controller:
                                RegisterCubit.of(context).nameStoreController,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InputFormField(
                                  hint: AppStrings.shopDescribeRegisterBody
                                      .translate(),
                                  icon: FontAwesomeIcons.store,
                                  fillColor: Colors.white,
                                  textColor: AppColors.fontColor,
                                  validator: Validator.productDetails,
                                  controller: RegisterCubit.of(context)
                                      .descStoreController,
                                ),
                              ),
                              SizedBox(
                                  width:
                                      AppSizes.getProportionateScreenWidth(10)),
                              InfoPopupWidget(
                                contentTitle: AppStrings.shopDescribeInfo.translate(),
                                contentTheme: const InfoPopupContentTheme(
                                  infoTextStyle:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                                child: const Icon(Icons.info),
                              ),
                            ],
                          ),
                          InputFormField(
                            hint: AppStrings.nameRegisterBody.translate(),
                            icon: Icons.person,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            validator: Validator.generalField,
                            controller:
                                RegisterCubit.of(context).nameController,
                          ),
                          InputFormField(
                            hint: AppStrings.phone.translate(),
                            icon: Icons.phone_android,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            isNumber: true,
                            validator: Validator.phoneNumber,
                            controller:
                                RegisterCubit.of(context).phoneController,
                          ),
                          InputFormField(
                            hint: AppStrings.emailRegisterBody.translate(),
                            icon: Icons.email_outlined,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            validator: Validator.email,
                            controller:
                                RegisterCubit.of(context).emailController,
                          ),
                          InputFormField(
                            hint: AppStrings.addressRegisterBody.translate(),
                            icon: Icons.location_on_outlined,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            validator: Validator.generalField,
                            controller:
                                RegisterCubit.of(context).addressController,
                          ),
                          BlocConsumer<LocationCubit, LocationState>(
                            bloc: RegisterCubit.of(context).locationCubit,
                            listener: (context, state) {
                              RegisterCubit.of(context)
                                  .locationController
                                  .text = state.model!.address;
                            },
                            builder: (context, state) {
                              return InputFormField(
                                hint: AppStrings.ourLocationWidget.translate(),
                                icon: Icons.location_searching,
                                fillColor: Colors.white,
                                textColor: AppColors.fontColor,
                                validator: Validator.generalField,
                                clickable: true,
                                controller: RegisterCubit.of(context)
                                    .locationController,
                                onTap: () => RegisterCubit.of(context)
                                    .onLocationClick(context),
                              );
                            },
                          ),
                          InputFormField(
                            hint: AppStrings.passwordLoginProviderBody
                                .translate(),
                            icon: Icons.lock_outlined,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            validator: Validator.password,
                            controller:
                                RegisterCubit.of(context).passwordController,
                            secure: true,
                          ),
                          InputFormField(
                            hint: AppStrings.confirmPassword.translate(),
                            icon: Icons.lock_outlined,
                            fillColor: Colors.white,
                            textColor: AppColors.fontColor,
                            validator: (value) => Validator.confirmPassword(
                                value,
                                RegisterCubit.of(context)
                                    .passwordController
                                    .text),
                            controller: RegisterCubit.of(context)
                                .confirmPasswordController,
                            secure: true,
                          ),
                          const DeliveryCostWidget(),
                          const RegisterAction(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
