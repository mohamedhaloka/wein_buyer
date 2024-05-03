import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/user/home/presentation/widget/address_home_item.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/controller/my_orders_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/validator/validator.dart';
import '../../../../../../../widgets/input_form_field.dart';
import '../../../../../core/utils/app_strings.dart';

class BottomSheetAddRateToProductWidget extends StatelessWidget {
  const BottomSheetAddRateToProductWidget({Key? key, required this.item})
      : super(key: key);

  final Items item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: AppSizes.screenHeight * 0.5,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                MagicRouter.pop();
              },
              child: Image.asset(AppAssets.exit_icon),
            ),
            SpaceH(inputHeigth: 15),
            Expanded(
              child: Container(
                width: AppSizes.screenWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(25),
                  vertical: AppSizes.getProportionateScreenHeight(20),
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.productRating.translate(),
                      style: TextStyle(
                        color: AppColors.fontColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    SpaceH(inputHeigth: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: RatingBar.builder(
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            updateOnDrag: true,
                            itemCount: 5,
                            itemSize: 50.sp,
                            direction: Axis.horizontal,
                            onRatingUpdate: (double value) {
                              MyOrdersCubit.of(context).rate = value;
                            },
                          ),
                        ),
                        const Divider(),
                        InputFormField(
                          hint: AppStrings.note.translate(),
                          fillColor: Colors.white,
                          textColor: AppColors.fontColor,
                          validator: Validator.notes,
                          controller: MyOrdersCubit.of(context).noteController,
                        ),
                        SpaceH(inputHeigth: 20),
                        BlocBuilder<MyOrdersCubit, MyOrdersState>(
                          builder: (context, state) {
                            return state is RateProductLoading ? const LoadingIndicator() : CustomButton(
                              text: AppStrings.send.translate(),
                              paddingVertical: 20,
                              onPress: () {
                                MyOrdersCubit.of(context)
                                    .rateProduct(item.productId!);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
