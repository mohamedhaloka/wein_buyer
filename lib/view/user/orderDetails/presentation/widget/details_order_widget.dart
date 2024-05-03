import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/controller/my_orders_cubit.dart';
import 'package:wein_buyer/view/user/orderDetails/presentation/widget/bottom_sheet_add_rate_to_product_widget.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../../core/models/orders_model.dart';
import '../../../../../../../core/utils/app_assets.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';
import '../../../../../core/utils/app_strings.dart';

class DetailsOrderWidget extends StatelessWidget {
  const DetailsOrderWidget({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 15),
            Text(
              AppStrings.orderDetailsScreen.translate(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.fontColor,
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(21)),
          child: Text(
            AppStrings.proudestTabSectionsWidget.translate(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.fontColor,
              fontSize: 14.sp,
            ),
          ),
        ),
        Column(
          children: List.generate(
            order.items!.length,
            (index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.getProportionateScreenWidth(21),
                  vertical: AppSizes.getProportionateScreenHeight(5),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: AppSizes.getProportionateScreenWidth(70),
                      height: AppSizes.getProportionateScreenHeight(70),
                      child: CachedNetworkImage(
                        imageUrl: order.items![index].image!.first,
                      ),
                    ),
                    SpaceW(inputWidth: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.items![index].name ?? '',
                            style: TextStyle(
                              color: AppColors.GrayColor112,
                              fontSize: 12.sp,
                            ),
                          ),
                          SpaceH(inputHeigth: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              order.items![index].details == null
                                  ? const SizedBox()
                                  : Row(
                                      children: [
                                        Text(
                                          '${order.items![index].quantity ?? ''} قطع . ${order.items![index].details!.size ?? ''}',
                                          style: TextStyle(
                                            color: AppColors.fontColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        SpaceW(inputWidth: 8),
                                        if (order
                                                .items![index].details!.color !=
                                            null)
                                          Container(
                                            height: AppSizes
                                                .getProportionateScreenHeight(
                                                    20),
                                            width: AppSizes
                                                .getProportionateScreenWidth(
                                                    20),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(int.parse(
                                                      order.items![index]
                                                          .details!.color!
                                                          .substring(1, 7),
                                                      radix: 16) +
                                                  0xFF000000),
                                            ),
                                          ),
                                      ],
                                    ),
                              order.status == 'finished'
                                  ? InkWell(
                                      onTap: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25),
                                            ),
                                          ),
                                          builder: (BuildContext conxt) {
                                            return BlocProvider.value(
                                              value: MyOrdersCubit.of(context),
                                              child:
                                                  BottomSheetAddRateToProductWidget(
                                                item: order.items![index],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          AppSizes.getProportionateScreenWidth(
                                              10),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              AppStrings.productRating
                                                  .translate(),
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SpaceW(inputWidth: 5),
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: AppColors.primaryColor,
                                              size: 18.sp,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
