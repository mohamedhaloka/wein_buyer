import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/deliveryCost/presentation/controller/delivery_cost_cubit.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import 'package:wein_buyer/widgets/custom_button_with_icon.dart';

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
        bottomNavigationBar: BlocBuilder<DeliveryCostCubit, DeliveryCostState>(
          buildWhen: (previous, current) =>
              current is ChangeStatusUiDeliveryCostState,
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.only(
                left: AppSizes.getProportionateScreenWidth(25),
                right: AppSizes.getProportionateScreenWidth(25),
                bottom: AppSizes.getProportionateScreenHeight(15),
              ),
              child: SizedBox(
                height: 50,
                child: CustomButtonWithIcon(
                  icon: Icons.edit_outlined,
                  colorIcon: Colors.black,
                  text: DeliveryCostCubit.of(context).statueUi
                      ? AppStrings.edit.translate()
                      : AppStrings.saveEdits.translate(),
                  fontColor: Colors.black,
                  buttonColor: AppColors.GrayColor239,
                  onPress: () {
                    if (DeliveryCostCubit.of(context).statueUi) {
                      DeliveryCostCubit.of(context)
                          .changeStatusUiDeliveryCost();
                    } else {
                      DeliveryCostCubit.of(context).updateDeliveryCost();
                    }
                  },
                ),
              ),
            );
          },
        ),
        body: const DeliveryCostBody(),
      ),
    );
  }
}
