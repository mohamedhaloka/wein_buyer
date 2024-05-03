import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/add_address_body.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.addAddress.translate(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<AddressesCubit, AddressesState>(
        builder: (context, state) {
          return state is AddAddressLoading
              ? const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
              : SizedBox(
                  width: AppSizes.screenWidth * 0.9,
                  height: AppSizes.getProportionateScreenHeight(55),
                  child: CustomButton(
                    text: AppStrings.saveAddress.translate(),
                    onPress: () {
                      AddressesCubit.of(context).addAddress();
                    },
                  ),
                );
        },
      ),
      body: AddAddressBody(),
    );
  }
}
