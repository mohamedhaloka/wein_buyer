import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';

import '../../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../../../widgets/custom_button.dart';
import '../../../../../../../widgets/loading_indicator.dart';
import '../../../../../bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import '../../../controller/pages_cubit.dart';

class CurrenciesBody extends StatelessWidget {
  const CurrenciesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesCubit, PagesState>(
      buildWhen: (previous, current) =>
          previous != current || current is SelectedCurrenciesState,
      builder: (context, state) {
        return state is GetCurrenciesLoading
            ? const LoadingIndicator()
            : Column(
                children: [
                  ListView.builder(
                    itemCount:
                        PagesCubit.of(context).currenciesModel!.body!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Radio(
                            activeColor: AppColors.primaryColor,
                            value: PagesCubit.of(context)
                                .currenciesModel!
                                .body![index],
                            groupValue:
                                PagesCubit.of(context).selectedCurrenciesModel,
                            onChanged: (v) {
                              PagesCubit.of(context).selectedCurrencies(v!);
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
                  SizedBox(height: AppSizes.getProportionateScreenHeight(20)),
                  Container(
                    height: AppSizes.getProportionateScreenHeight(50),
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.getProportionateScreenWidth(18)),
                    child: CustomButton(
                      text: AppStrings.save.translate(),
                      onPress: () {
                        if (PagesCubit.of(context).selectedCurrenciesModel !=
                            null) {
                          AppStorage.cacheSelectedUserCurrency(
                              PagesCubit.of(context).selectedCurrenciesModel!);
                          MagicRouter.navigateAndPopAll(
                              BottomNavUserScreen(selectedIndex: 0));
                        }
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
