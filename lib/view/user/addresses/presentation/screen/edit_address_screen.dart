import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/addresses_model.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/custom_appbar.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/addresses_cubit.dart';
import '../widget/edit_address_body.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({Key? key, required this.address}) : super(key: key);

  final Address address;

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  void initState() {
    AddressesCubit.of(context).setData(widget.address);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.editeAddressesScreen.translate(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocBuilder<AddressesCubit, AddressesState>(
        builder: (context, state) {
          return state is EditAddressLoading
              ? const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                )
              : SizedBox(
                  width: AppSizes.screenWidth * 0.9,
                  height: AppSizes.getProportionateScreenHeight(55),
                  child: CustomButton(
                    text: AppStrings.editeAddressesScreen.translate(),
                    onPress: () {
                      AddressesCubit.of(context)
                          .editAddress(widget.address.id!);
                    },
                  ),
                );
        },
      ),
      body: const EditAddressBody(),
    );
  }
}
