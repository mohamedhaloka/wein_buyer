import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/deliveryCost/presentation/controller/delivery_cost_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';

import '../../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/delivery_cost_body.dart';

class DeliveryCostScreen extends StatelessWidget {
  const DeliveryCostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeliveryCostCubit(sl(), sl())..getDeliveryCost(),
      child: Scaffold(
        appBar: CustomAppBar(
          text: AppStrings.deliveryCostTitle.translate(),
        ),
        body: DeliveryCostBody(),
      ),
    );
  }
}
