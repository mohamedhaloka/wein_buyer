import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../core/models/orders_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../../widgets/custom_button.dart';
import '../../../../../../widgets/space_width.dart';
import '../../../../../../widgets/tab_widget.dart';

class DetailsOrderWidget extends StatelessWidget {
  const DetailsOrderWidget({Key? key, required this.order}) : super(key: key);

  final Order order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const TabWidget(),
                SpaceW(inputWidth: 15),
                Text(
                  AppStrings.detailsOrderWidget.translate(),
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
                horizontal: AppSizes.getProportionateScreenWidth(20),
              ),
              child: CustomButton(
                text: order.statusText ?? '',
                fontColor: order.status == 'new'
                    ? Colors.green
                    : order.status == 'in_progress'
                        ? AppColors.blue
                        : order.status == 'canceled'
                            ? Colors.grey
                            : order.status == 'rejected'
                                ? Colors.red
                                : order.status == 'finished'
                                    ? Colors.green
                                    : Colors.white,
                buttonColor: order.status == 'new'
                    ? Colors.green.withOpacity(0.1)
                    : order.status == 'in_progress'
                        ? AppColors.blue.withOpacity(0.1)
                        : order.status == 'canceled'
                            ? Colors.grey.withOpacity(0.1)
                            : order.status == 'rejected'
                                ? Colors.red.withOpacity(0.1)
                                : order.status == 'finished'
                                    ? Colors.green.withOpacity(0.1)
                                    : Colors.white,
                onPress: () {},
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(21)),
          child: Text(
            'عدد المنتجات: ${order.items!.length}',
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
                          imageUrl: order.items![index].image!.first),
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
                          Text(
                            "${order.items![index].price} ${order.currencyCode}",
                            style: TextStyle(
                              color: AppColors.fontColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                          ),
                          SpaceH(inputHeigth: 5),
                          order.items![index].details == null
                              ? const SizedBox()
                              : Row(
                                  children: [
                                    Text(
                                      '${order.items![index].quantity} قطع . ${order.items![index].details!.size ?? ''}',
                                      style: TextStyle(
                                        color: AppColors.fontColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SpaceW(inputWidth: 8),
                                    Container(
                                      height:
                                          AppSizes.getProportionateScreenHeight(
                                              20),
                                      width:
                                          AppSizes.getProportionateScreenWidth(
                                              20),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: order.items![index].details!
                                                    .color ==
                                                null
                                            ? null
                                            : Color(int.parse(
                                                    order.items![index].details!
                                                        .color!
                                                        .substring(1, 7),
                                                    radix: 16) +
                                                0xFF000000),
                                      ),
                                    ),
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
