import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/view/provider/product/presentation/screen/edit_product_screen.dart';
import 'package:wein_buyer/widgets/custom_button_with_icon.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/models/products_model.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class MoreForProductItem extends StatelessWidget {
  const MoreForProductItem({Key? key, required this.productData})
      : super(key: key);

  final ProductData productData;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        height: AppSizes.screenHeight * 0.3,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(20),
            horizontal: AppSizes.getProportionateScreenWidth(25),
          ),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  MagicRouter.pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.01),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    AppSizes.getProportionateScreenWidth(20),
                  ),
                  child: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                ),
              ),
              SpaceH(inputHeigth: 25),
              CustomButtonWithIcon(
                icon: Icons.edit,
                colorIcon: Colors.black,
                text: AppStrings.edit.translate(),
                fontColor: Colors.black,
                buttonColor: Colors.white,
                onPress: () {
                  MagicRouter.pop();
                  MagicRouter.navigateTo(
                      EditProductScreen(productData: productData));
                },
              ),
              SpaceH(inputHeigth: 10),
              CustomButtonWithIcon(
                icon: Icons.delete_forever_outlined,
                colorIcon: Colors.red,
                text: AppStrings.deleteMoreForProductItem.translate(),
                fontColor: Colors.red,
                buttonColor: Colors.white,
                onPress: () {
                  MarketCubit.of(context).deleteProduct(productData.id ?? 0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
