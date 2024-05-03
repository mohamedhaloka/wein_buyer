import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/addresses/presentation/controller/addresses_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/addresses_body.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressesCubit(sl() , sl() , sl(), sl(), sl())..getAddresses(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.addressesScreen.translate(),
        ),
        body: const AddressesBody(),
      ),
    );
  }
}
