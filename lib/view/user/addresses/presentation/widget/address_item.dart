import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/addresses/presentation/screen/edit_address_screen.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../core/utils/app_strings.dart';

class AddressItem extends StatelessWidget {
  const AddressItem({Key? key, required this.address}) : super(key: key);

  final Address address;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AddressesCubit.of(context).onSelectedAddressItemDefault(address.id!);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.getProportionateScreenWidth(15),
          vertical: AppSizes.getProportionateScreenHeight(7),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(15),
            vertical: AppSizes.getProportionateScreenHeight(15),
          ),
          decoration: BoxDecoration(
            color: address.isDefault!
                ? AppColors.primaryLightColor
                : const Color.fromRGBO(251, 251, 251, 1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: address.isDefault!
                  ? AppColors.primaryColor
                  : AppColors.GrayColor239,
            ),
          ),
          child: Column(
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
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.edit,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          MagicRouter.navigateTo(BlocProvider.value(
                            value: AddressesCubit.of(context),
                            child: EditAddressScreen(address: address),
                          ));
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.delete_forever_rounded,
                          size: 20.sp,
                        ),
                        onPressed: () {
                          AddressesCubit.of(context)
                              .deleteAddress(address.id!);
                          // if (AddressesCubit.of(context)
                          //         .listOfAddress
                          //         .firstWhere(
                          //             (element) => element.id == address.id)
                          //         .isDefault ==
                          //     false) {
                          //
                          // }
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  address.phone ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.fontColor,
                  ),
                ),
              ),
              SpaceH(inputHeigth: 10),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  address.address ?? '',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.GrayColor112,
                  ),
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
          ),
        ),
      ),
    );
  }
}
