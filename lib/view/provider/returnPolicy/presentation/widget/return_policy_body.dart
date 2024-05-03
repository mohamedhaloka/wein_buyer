  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/returnPolicy/presentation/controller/return_policy_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/custom_button_with_icon.dart';

import '../../../../../../widgets/input_form_field.dart';
import '../../../../../../widgets/loading_indicator.dart';
import '../../../../../core/utils/app_strings.dart';

class ReturnPolicyBody extends StatelessWidget {
  ReturnPolicyBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(251, 251, 251, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.getProportionateScreenHeight(35),
          horizontal: AppSizes.getProportionateScreenWidth(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<ReturnPolicyCubit, ReturnPolicyState>(
              buildWhen: (previous, current) =>
                  current is ChangeStatusUiReturnPolicyState,
              builder: (context, state) {
                return InputFormField(
                  upperText: AppStrings.returnPolicyScreen.translate(),
                  hint: AppStrings.enterReturnPolicyScreen.translate(),
                  clickable:
                      ReturnPolicyCubit.of(context).statueUi ? true : false,
                  controller:
                      ReturnPolicyCubit.of(context).returnPolicyController,
                  maxLines: 6,
                  multiLine: true,
                  validator: (v) {},
                );
              },
            ),
            BlocBuilder<ReturnPolicyCubit, ReturnPolicyState>(
              buildWhen: (previous, current) =>
                  current is ChangeStatusUiReturnPolicyState,
              builder: (context, state) {
                return CustomButtonWithIcon(
                  icon: Icons.edit_outlined,
                  colorIcon: Colors.black,
                  text: ReturnPolicyCubit.of(context).statueUi ? '${AppStrings.edit.translate()}' : '${AppStrings.saveEdits.translate()}',
                  fontColor: Colors.black,
                  buttonColor: AppColors.GrayColor239,
                  onPress: () {
                    if(ReturnPolicyCubit.of(context).statueUi){
                      ReturnPolicyCubit.of(context).changeStatusUiReturnPolicy();
                    }else{
                      ReturnPolicyCubit.of(context).updateReturnPolicy();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
