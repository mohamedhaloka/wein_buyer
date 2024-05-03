import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/settingsMarket/presentation/controller/setting_market_cubit.dart';
import 'package:wein_buyer/view/provider/settingsMarket/presentation/widget/settings_market_item.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../deliveryCost/presentation/screen/delivery_cost_screen.dart';
import '../../../returnPolicy/presentation/screen/return_policy_screen.dart';
import '../../../sizeGuide/presentation/screen/size_guide_screen.dart';

class SettingsMarketBody extends StatelessWidget {
  const SettingsMarketBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(15),
        horizontal: AppSizes.getProportionateScreenWidth(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.getProportionateScreenHeight(10),
              horizontal: AppSizes.getProportionateScreenWidth(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.settingsMarketBody.translate(),
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 16.sp,
                  ),
                ),
                InkWell(
                  onTap: () {
                    SettingMarketCubit.of(context).toggleOpenStatus();
                  },
                  child: Container(
                    width: AppSizes.getProportionateScreenWidth(120),
                    height: AppSizes.getProportionateScreenHeight(30),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BlocBuilder<SettingMarketCubit, SettingMarketState>(
                      buildWhen: (previous, current) =>
                          current is ToggleOpenStatusState,
                      builder: (context, state) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: SettingMarketCubit.of(context)
                                      .toggleOpenStatusVal!
                                  ? false
                                  : true,
                              child: Container(
                                width: AppSizes.getProportionateScreenWidth(70),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child:  Text(
                                  AppStrings.closedHeaderMarketWidget.translate(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: SettingMarketCubit.of(context)
                                      .toggleOpenStatusVal!
                                  ? true
                                  : false,
                              child: Container(
                                width: AppSizes.getProportionateScreenWidth(70),
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(42, 211, 55, 1),
                                  border: Border.all(
                                    color: const Color.fromRGBO(42, 211, 55, 1),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.center,
                                child:  Text(
                                AppStrings.openHeaderMarketWidget.translate()  ,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SettingsMarketItem(
            text: AppStrings.mapMarketBody.translate(),
            onTap: () {
              MagicRouter.navigateTo(const SizeGuideScreen());
            },
          ),
          const Divider(),
          SettingsMarketItem(
            text: AppStrings.returnPolicyScreen.translate(),
            onTap: () {
              MagicRouter.navigateTo(const ReturnPolicyScreen());
            },
          ),
          const Divider(),
          SettingsMarketItem(
            text: AppStrings.costDeliveryMarketBody.translate(),
            onTap: () {
              MagicRouter.navigateTo(const DeliveryCostScreen());
            },
          ),
        ],
      ),
    );
  }
}
