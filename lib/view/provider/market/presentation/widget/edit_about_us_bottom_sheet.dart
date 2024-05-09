import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class EditAboutUsBottomSheet extends StatelessWidget {
  const EditAboutUsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MarketCubit.of(context).aboutUsController.clear();
        return true;
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: AppSizes.screenHeight * 0.3,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(10),
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpaceH(inputHeigth: 5),
                Text(
                  AppStrings.editAboutUsBottomSheet.translate(),
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SpaceH(inputHeigth: 20),
                InputFormField(
                  hint: AppStrings.aboutUsWidget.translate(),
                  textColor: AppColors.fontColor,
                  controller: MarketCubit.of(context).aboutUsController,
                  validator: (v) {},
                ),
                SpaceH(inputHeigth: 15),
                BlocBuilder<MarketCubit, MarketState>(
                  builder: (context, state) {
                    return state is EditMarketDetailsLoading
                        ? const LoadingIndicator()
                        : CustomButton(
                            text: AppStrings.editAboutUsBottomSheet.translate(),
                            radius: 10,
                            onPress: () {
                              MarketCubit.of(context).editAboutUs(
                                context,
                              );
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
