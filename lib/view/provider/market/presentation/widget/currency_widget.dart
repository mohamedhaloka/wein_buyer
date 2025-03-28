import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';
import '../../../../../core/models/profile_provider_model.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/market_cubit.dart';
import 'edit_currency_bottom_sheet.dart';

class CurrencyWidget extends StatelessWidget {
  const CurrencyWidget({Key? key, required this.profileModel})
      : super(key: key);

  final Profile profileModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(
              height: 35,
              width: 4,
            ),
            SpaceW(inputWidth: 20),
            Text(
              tr(context, AppStrings.changeCurrency),
              style: TextStyle(
                color: AppColors.fontColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.edit_outlined,
                color: AppColors.primaryColor,
                size: 18,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  builder: (BuildContext cont) {
                    return BlocProvider.value(
                      value: MarketCubit.of(context),
                      child: const EditCurrencyBottomSheet(),
                    );
                  },
                );
              },
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(20),
          ),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "${profileModel.user!.currency!.name}",
              style: TextStyle(
                color: AppColors.GrayColor112,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
