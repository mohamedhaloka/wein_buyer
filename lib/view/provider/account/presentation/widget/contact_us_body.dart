import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../core/validator/validator.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/input_form_field.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../widgets/space_width.dart';
import '../controller/account_cubit.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(15),
        vertical: AppSizes.getProportionateScreenHeight(20),
      ),
      child: Form(
        key: AccountCubit.of(context).formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              InputFormField(
                hint: AppStrings.name.translate(),
                icon: Icons.person,
                fillColor: Colors.white,
                textColor: AppColors.fontColor,
                validator: Validator.generalField,
                controller: AccountCubit.of(context).nameController,
              ),
              SpaceH(inputHeigth: 20),
              InputFormField(
                hint: AppStrings.email.translate(),
                icon: Icons.email_outlined,
                fillColor: Colors.white,
                textColor: AppColors.fontColor,
                validator: Validator.email,
                controller: AccountCubit.of(context).emailController,
              ),
              SpaceH(inputHeigth: 20),
              InputFormField(
                hint: AppStrings.phone.translate(),
                icon: Icons.phone_android,
                fillColor: Colors.white,
                textColor: AppColors.fontColor,
                isNumber: true,
                validator: Validator.phoneNumber,
                controller: AccountCubit.of(context).phoneController,
              ),
              SpaceH(inputHeigth: 20),
              InputFormField(
                hint: AppStrings.msg.translate(),
                icon: Icons.note_outlined,
                fillColor: Colors.white,
                textColor: AppColors.fontColor,
                multiLine: true,
                maxLines: 5,
                validator: Validator.notes,
                controller: AccountCubit.of(context).msgController,
              ),
              SpaceH(inputHeigth: 50),
              BlocBuilder<AccountCubit, AccountState>(
                builder: (context, state) {
                  return state is ContactUsLoading
                      ? const LoadingIndicator()
                      : CustomButton(
                          text: AppStrings.send.translate(),
                          radius: 10,
                          paddingVertical:
                              AppSizes.getProportionateScreenHeight(20),
                          onPress: () {
                            AccountCubit.of(context).contactUs();
                          },
                        );
                },
              ),
              SpaceH(inputHeigth: 30),
              Text(
                AppStrings.followUs.translate(),
                style: TextStyle(
                  color: AppColors.fontColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SpaceH(inputHeigth: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // InkWell(
                  //   onTap: () {},
                  //   child: Image.asset(
                  //     AppAssets.instagram_icon,
                  //     width: AppSizes.getProportionateScreenWidth(50),
                  //   ),
                  // ),
                  // SpaceW(inputWidth: 20),
                  InkWell(
                    onTap: ()=> AppFunc.launchUrlFun(AppStrings.tiktokURL),
                    child: Image.asset(
                      AppAssets.tiktok_icon,
                      width: AppSizes.getProportionateScreenWidth(45),
                    ),
                  ),
                  SpaceW(inputWidth: 20),
                  InkWell(
                    onTap: ()=> AppFunc.launchUrlFun(AppStrings.facebookURL),
                    child: Image.asset(
                      AppAssets.facebook_icon,
                      width: AppSizes.getProportionateScreenWidth(50),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
