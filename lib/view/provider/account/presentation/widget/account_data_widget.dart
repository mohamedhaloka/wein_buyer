import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/space_height.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../market/presentation/controller/market_cubit.dart';

class AccountDataWidget extends StatelessWidget {
  const AccountDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 15),
            Text(
              AppStrings.accountData.translate(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 10),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(20),
          ),
          child: BlocBuilder<MarketCubit, MarketState>(
            builder: (context, state) {
              return state is GetProfileDataLoading
                  ? const LoadingIndicator()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.vendorName.translate(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 5),
                        Text(
                          MarketCubit.of(context).profileModel!.user!.name ??
                              '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        const Divider(),
                        Text(
                          AppStrings.storeName.translate(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 5),
                        Text(
                          MarketCubit.of(context).profileModel!.user!.storeName ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        const Divider(),
                        Text(
                          AppStrings.phone.translate(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 5),
                        Text(
                          MarketCubit.of(context).profileModel!.user!.phone ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        const Divider(),
                        Text(
                          AppStrings.email.translate(),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 5),
                        Text(
                          MarketCubit.of(context).profileModel!.user!.email ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.GrayColor161,
                          ),
                        ),
                        SpaceH(inputHeigth: 20),
                      ],
                    );
            },
          ),
        ),
      ],
    );
  }
}
