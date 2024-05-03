import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/view/user/addresses/presentation/screen/add_address_screen.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import 'address_item.dart';

class AddressesBody extends StatelessWidget {
  const AddressesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocBuilder<AddressesCubit, AddressesState>(
            buildWhen: (previous, current) =>
                previous != current ||
                current is OnSelectedAddressItemDefaultState ||
                current is DeleteAddressLoaded,
            builder: (context, state) {
              return state is GetAddressesLoading
                  ? const LoadingIndicator()
                  : AddressesCubit.of(context).listOfAddress.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppAssets.address_img),
                            SpaceH(inputHeigth: 10),
                            Text(
                              AppStrings.notAddNewAddress.translate(),
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: AppColors.fontColor,
                              ),
                            ),
                          ],
                        )
                      : ListView.builder(
                          itemCount:
                              AddressesCubit.of(context).listOfAddress.length,
                          itemBuilder: (context, index) {
                            return AddressItem(
                              address: AddressesCubit.of(context)
                                  .listOfAddress[index],
                            );
                          },
                        );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(15),
            vertical: AppSizes.getProportionateScreenHeight(5),
          ),
          child: CustomButton(
            text: AppStrings.addNewAddress.translate(),
            paddingVertical: 20,
            onPress: () {
              MagicRouter.navigateTo(
                BlocProvider.value(
                  value: AddressesCubit.of(context),
                  child: const AddAddressScreen(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
