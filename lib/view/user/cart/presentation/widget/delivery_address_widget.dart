import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/addresses/presentation/screen/addresses_screen.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/models/addresses_model.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';
import 'no_delivery_address_widget.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 10),
            Text(
              AppStrings.driveAddress.translate(),
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SpaceH(inputHeigth: 10),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(15),
              vertical: AppSizes.getProportionateScreenHeight(15),
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(251, 251, 251, 1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.GrayColor239,
              ),
            ),
            child: BlocBuilder<AddressesCubit, AddressesState>(
              buildWhen: (previous, current) =>
                  previous != current ||
                  current is OnSelectedAddressItemDefaultState,
              builder: (context, state) {
                if (state is GetAddressesLoading) {
                  return const LoadingIndicator();
                } else {
                  if(AddressesCubit.of(context)
                      .listOfAddress.isEmpty){
                    return const NoDeliveryAddressWidget();
                  }else{
                    Address address = AddressesCubit.of(context)
                        .listOfAddress
                        .firstWhere((element) => element.isDefault == true);
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              address.recipientName ?? '',
                              style: TextStyle(
                                color: AppColors.fontColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '#${address.id}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        SpaceH(inputHeigth: 5),
                        Text(
                          address.address ?? '',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.GrayColor112,
                          ),
                        ),
                        SpaceH(inputHeigth: 10),
                        Row(
                          children: [
                            Image.asset(
                              AppAssets.flag,
                            ),
                            SpaceW(inputWidth: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.nearAddressOrderWidget.translate(),
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.GrayColor112,
                                    ),
                                  ),
                                  Text(
                                    address.nearestAddress ?? '',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.fontColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
