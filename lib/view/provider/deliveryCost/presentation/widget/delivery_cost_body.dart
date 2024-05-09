import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/deliveryCost/presentation/controller/delivery_cost_cubit.dart';

import '../../../../../../widgets/input_form_field.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/validator/validator.dart';

class DeliveryCostBody extends StatelessWidget {
  const DeliveryCostBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(251, 251, 251, 1),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(35),
          horizontal: AppSizes.getProportionateScreenWidth(25),
        ),
        child: Form(
          key: DeliveryCostCubit.of(context).formKey,
          child: BlocBuilder<DeliveryCostCubit, DeliveryCostState>(
            buildWhen: (previous, current) =>
                current is ChangeStatusUiDeliveryCostState,
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.aroundMeTitle.translate(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InfoPopupWidget(
                        contentTitle: AppStrings.aroundMe.translate(),
                        contentTheme: const InfoPopupContentTheme(
                          infoTextStyle:
                              TextStyle(color: AppColors.primaryColor),
                        ),
                        child: const Icon(Icons.info),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.getProportionateScreenHeight(5)),
                  InputFormField(
                    hint: AppStrings.min.translate(),
                    icon: Icons.social_distance,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    controller:
                        DeliveryCostCubit.of(context).aroundMeMinController,
                    clickable: true,
                    validator: Validator.generalField,
                    suffixIcon: Container(
                      width: AppSizes.getProportionateScreenWidth(60),
                      alignment: Alignment.center,
                      child: const Text('Km'),
                    ),
                  ),
                  InputFormField(
                    hint: AppStrings.max.translate(),
                    icon: Icons.social_distance,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    controller:
                        DeliveryCostCubit.of(context).aroundMeMaxController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                    suffixIcon: Container(
                      width: AppSizes.getProportionateScreenWidth(60),
                      alignment: Alignment.center,
                      child: const Text('Km'),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.emptyField.translate();
                      } else if (num.parse(value) <=
                          num.parse(DeliveryCostCubit.of(context)
                              .aroundMeMinController
                              .text)) {
                        return AppStrings.aroundMeMaxValidation.translate();
                      }
                    },
                  ),
                  InputFormField(
                    hint: AppStrings.price.translate(),
                    icon: Icons.price_change_outlined,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                    validator: Validator.generalField,
                    controller:
                        DeliveryCostCubit.of(context).aroundMePriceController,
                  ),
                  SizedBox(height: AppSizes.getProportionateScreenHeight(8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.localShippingTitle.translate(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InfoPopupWidget(
                        contentTitle: AppStrings.localShipping.translate(),
                        contentTheme: const InfoPopupContentTheme(
                          infoTextStyle:
                              TextStyle(color: AppColors.primaryColor),
                        ),
                        child: const Icon(Icons.info),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.getProportionateScreenHeight(5)),
                  InputFormField(
                    hint: AppStrings.min.translate(),
                    icon: Icons.social_distance,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    controller:
                        DeliveryCostCubit.of(context).localeMinController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                    suffixIcon: Container(
                      width: AppSizes.getProportionateScreenWidth(60),
                      alignment: Alignment.center,
                      child: const Text('Km'),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.emptyField.translate();
                      } else if (value !=
                          DeliveryCostCubit.of(context)
                              .aroundMeMaxController
                              .text) {
                        return AppStrings.localeMinValidation.translate();
                      }
                    },
                  ),
                  InputFormField(
                    hint: AppStrings.max.translate(),
                    icon: Icons.social_distance,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    controller:
                        DeliveryCostCubit.of(context).localeMaxController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                    suffixIcon: Container(
                      width: AppSizes.getProportionateScreenWidth(60),
                      alignment: Alignment.center,
                      child: const Text('Km'),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.emptyField.translate();
                      } else if (num.parse(value) <=
                          num.parse(DeliveryCostCubit.of(context)
                              .localeMinController
                              .text)) {
                        return AppStrings.localeMaxValidation.translate();
                      }
                    },
                  ),
                  InputFormField(
                    hint: AppStrings.price.translate(),
                    icon: Icons.price_change_outlined,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    validator: Validator.generalField,
                    controller:
                        DeliveryCostCubit.of(context).localePriceController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                  ),
                  SizedBox(height: AppSizes.getProportionateScreenHeight(8)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.domesticShippingTitle.translate(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InfoPopupWidget(
                        contentTitle: AppStrings.domesticShipping.translate(),
                        contentTheme: const InfoPopupContentTheme(
                          infoTextStyle:
                              TextStyle(color: AppColors.primaryColor),
                        ),
                        child: const Icon(Icons.info),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.getProportionateScreenHeight(5)),
                  InputFormField(
                    hint: AppStrings.min.translate(),
                    icon: Icons.social_distance,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    controller:
                        DeliveryCostCubit.of(context).domesticMinController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                    suffixIcon: Container(
                      width: AppSizes.getProportionateScreenWidth(60),
                      alignment: Alignment.center,
                      child: const Text('Km'),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.emptyField.translate();
                      } else if (value !=
                          DeliveryCostCubit.of(context)
                              .localeMaxController
                              .text) {
                        return AppStrings.domesticMinValidation.translate();
                      }
                    },
                  ),
                  InputFormField(
                    hint: AppStrings.max.translate(),
                    icon: Icons.social_distance,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    controller:
                        DeliveryCostCubit.of(context).domesticMaxController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                    suffixIcon: Container(
                      width: AppSizes.getProportionateScreenWidth(60),
                      alignment: Alignment.center,
                      child: const Text('Km'),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return AppStrings.emptyField.translate();
                      } else if (num.parse(value) <=
                          num.parse(DeliveryCostCubit.of(context)
                              .domesticMinController
                              .text)) {
                        return AppStrings.domesticMaxValidation.translate();
                      }
                    },
                  ),
                  InputFormField(
                    hint: AppStrings.price.translate(),
                    icon: Icons.price_change_outlined,
                    fillColor: Colors.white,
                    textColor: AppColors.fontColor,
                    isNumber: true,
                    validator: Validator.generalField,
                    controller:
                        DeliveryCostCubit.of(context).domesticPriceController,
                    clickable:
                        DeliveryCostCubit.of(context).statueUi ? true : false,
                  ),
                  // InputFormField(
                  //   upperText: AppStrings.aroundMe.translate(),
                  //   hint: AppStrings.aroundMe.translate(),
                  //   clickable:
                  //       DeliveryCostCubit.of(context).statueUi ? true : false,
                  //   controller:
                  //       DeliveryCostCubit.of(context).dp0k5kController,
                  //   suffixIcon: Container(
                  //     width: AppSizes.getProportionateScreenWidth(60),
                  //     alignment: Alignment.center,
                  //     child: Text(AppStrings.pound.translate()),
                  //   ),
                  //   validator: (v) {},
                  // ),
                  // InputFormField(
                  //   upperText: AppStrings.localShipping.translate(),
                  //   hint: AppStrings.localShipping.translate(),
                  //   clickable:
                  //       DeliveryCostCubit.of(context).statueUi ? true : false,
                  //   controller:
                  //       DeliveryCostCubit.of(context).dp5k20kController,
                  //   suffixIcon: Container(
                  //     width: AppSizes.getProportionateScreenWidth(60),
                  //     alignment: Alignment.center,
                  //     child: Text(AppStrings.pound.translate()),
                  //   ),
                  //   validator: (v) {},
                  // ),
                  // InputFormField(
                  //   upperText: AppStrings.domesticShipping.translate(),
                  //   hint: AppStrings.domesticShipping.translate(),
                  //   clickable:
                  //       DeliveryCostCubit.of(context).statueUi ? true : false,
                  //   controller:
                  //       DeliveryCostCubit.of(context).dpMoreThan20kController,
                  //   suffixIcon: Container(
                  //     width: AppSizes.getProportionateScreenWidth(60),
                  //     alignment: Alignment.center,
                  //     child: Text(AppStrings.pound.translate()),
                  //   ),
                  //   validator: (v) {},
                  // ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
