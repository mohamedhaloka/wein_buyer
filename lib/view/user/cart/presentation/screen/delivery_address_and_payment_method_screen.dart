import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';

import '../../../../../../../core/models/cart_model.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../../../widgets/custom_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/delivery_address_and_payment_method_body.dart';

class DeliveryAddressAndPaymentMethodScreen extends StatelessWidget {
  const DeliveryAddressAndPaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AddressesCubit(sl(), sl(), sl(), sl(), sl())..getAddresses(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.rubbishScreen.translate(),
        ),
        body: const DeliveryAddressAndPaymentMethodBody(),
      ),
    );
  }
}
