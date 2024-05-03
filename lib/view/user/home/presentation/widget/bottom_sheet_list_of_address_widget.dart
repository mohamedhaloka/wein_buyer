import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/home/presentation/widget/address_home_item.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

class BottomSheetListOfAddressWidget extends StatelessWidget {
  const BottomSheetListOfAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.screenHeight * 0.55,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              MagicRouter.pop();
            },
            child: Image.asset(AppAssets.exit_icon),
          ),
          SpaceH(inputHeigth: 15),
          Expanded(
            child: Container(
              width: AppSizes.screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.getProportionateScreenWidth(15),
                vertical: AppSizes.getProportionateScreenHeight(20),
              ),
              child: Column(
                children: [
                  Text(
                    AppStrings.addresses.translate(),
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  SpaceH(inputHeigth: 20),
                  Expanded(
                    child: BlocBuilder<AddressesCubit, AddressesState>(
                      buildWhen: (previous, current) =>
                          previous != current ||
                          current is OnSelectedAddressItemDefaultState,
                      builder: (context, state) {
                        return state is GetAddressesLoading
                            ? const LoadingIndicator()
                            : ListView.builder(
                                itemCount: AddressesCubit.of(context)
                                    .listOfAddress
                                    .length,
                                itemBuilder: (context, index) {
                                  return AddressHomeItem(
                                    address: AddressesCubit.of(context)
                                        .listOfAddress[index],
                                  );
                                },
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
