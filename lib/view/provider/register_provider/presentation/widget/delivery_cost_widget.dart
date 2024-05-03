import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/validator/validator.dart';
import '../../../../../widgets/input_form_field.dart';
import '../controller/register_cubit.dart';

class DeliveryCostWidget extends StatelessWidget {
  const DeliveryCostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.getProportionateScreenHeight(3)),
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
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
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
          clickable: true,
          controller: RegisterCubit.of(context).aroundMeMinController,
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
          controller: RegisterCubit.of(context).aroundMeMaxController,
          suffixIcon: Container(
            width: AppSizes.getProportionateScreenWidth(60),
            alignment: Alignment.center,
            child: const Text('Km'),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return AppStrings.emptyField.translate();
            } else if (num.parse(value) <=
                num.parse(
                    RegisterCubit.of(context).aroundMeMinController.text)) {
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
          validator: Validator.generalField,
          controller: RegisterCubit.of(context).aroundMePriceController,
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
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
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
          controller: RegisterCubit.of(context).localeMinController,
          suffixIcon: Container(
            width: AppSizes.getProportionateScreenWidth(60),
            alignment: Alignment.center,
            child: const Text('Km'),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return AppStrings.emptyField.translate();
            } else if (value !=
                RegisterCubit.of(context).aroundMeMaxController.text) {
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
          controller: RegisterCubit.of(context).localeMaxController,
          suffixIcon: Container(
            width: AppSizes.getProportionateScreenWidth(60),
            alignment: Alignment.center,
            child: const Text('Km'),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return AppStrings.emptyField.translate();
            } else if (num.parse(value) <=
                num.parse(RegisterCubit.of(context).localeMinController.text)) {
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
          controller: RegisterCubit.of(context).localePriceController,
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
                infoTextStyle: TextStyle(color: AppColors.primaryColor),
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
          controller: RegisterCubit.of(context).domesticMinController,
          suffixIcon: Container(
            width: AppSizes.getProportionateScreenWidth(60),
            alignment: Alignment.center,
            child: const Text('Km'),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return AppStrings.emptyField.translate();
            } else if (value !=
                RegisterCubit.of(context).localeMaxController.text) {
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
          controller: RegisterCubit.of(context).domesticMaxController,
          suffixIcon: Container(
            width: AppSizes.getProportionateScreenWidth(60),
            alignment: Alignment.center,
            child: const Text('Km'),
          ),
          validator: (value) {
            if (value.isEmpty) {
              return AppStrings.emptyField.translate();
            } else if (num.parse(value) <=
                num.parse(
                    RegisterCubit.of(context).domesticMinController.text)) {
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
          controller: RegisterCubit.of(context).domesticPriceController,
        ),
      ],
    );
  }
}
