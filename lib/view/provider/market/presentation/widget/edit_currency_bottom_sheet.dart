import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/services/services_locator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../user/pages/view/controller/pages_cubit.dart';

class EditCurrencyBottomSheet extends StatelessWidget {
  const EditCurrencyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MarketCubit.of(context).radiusController.clear();
        return true;
      },
      child: BlocProvider(
        create: (context) =>
            PagesCubit(sl(), sl(), sl(), sl())..getCurrencies(),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: AppSizes.screenHeight * 0.6,
            padding: EdgeInsets.symmetric(
              vertical: AppSizes.getProportionateScreenHeight(20),
              horizontal: AppSizes.getProportionateScreenWidth(15),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: BlocBuilder<PagesCubit, PagesState>(
              buildWhen: (previous, current) =>
                  previous != current || current is SelectedCurrenciesState,
              builder: (context, state) {
                return state is GetCurrenciesLoading
                    ? const LoadingIndicator()
                    : Column(
                        children: [
                          ListView.builder(
                            itemCount: PagesCubit.of(context)
                                .currenciesModel!
                                .body!
                                .length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Row(
                                children: [
                                  Radio(
                                    activeColor: AppColors.primaryColor,
                                    value: PagesCubit.of(context)
                                        .currenciesModel!
                                        .body![index],
                                    groupValue: PagesCubit.of(context)
                                        .selectedCurrenciesModel,
                                    onChanged: (v) {
                                      PagesCubit.of(context)
                                          .selectedCurrencies(v!);
                                    },
                                  ),
                                  Text(PagesCubit.of(context)
                                          .currenciesModel!
                                          .body![index]
                                          .name ??
                                      ''),
                                ],
                              );
                            },
                          ),
                          SizedBox(
                              height:
                                  AppSizes.getProportionateScreenHeight(20)),
                          Container(
                            height: AppSizes.getProportionateScreenHeight(50),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppSizes.getProportionateScreenWidth(18)),
                            child: CustomButton(
                              text: AppStrings.save.translate(),
                              onPress: () {
                                if (PagesCubit.of(context)
                                        .selectedCurrenciesModel !=
                                    null) {
                                  MarketCubit.of(context).editCurrency(
                                      context,
                                      PagesCubit.of(context)
                                          .selectedCurrenciesModel!);
                                }
                              },
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
