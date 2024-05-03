import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/orders_model.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import '../core/router/router.dart';
import '../core/utils/app_strings.dart';
import '../view/provider/orderDetails/presentation/screen/order_details_screen.dart';
import '../view/user/orderDetails/presentation/screen/order_details_screen.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order, required this.isProvider}) : super(key: key);

  final Order order;
  final bool isProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(5),
      ),
      child: InkWell(
        onTap: () {
          if(isProvider){
            MagicRouter.navigateTo(
              OrderDetailsProviderScreen(
                order: order,
              ),
            );
          }else{
            MagicRouter.navigateTo(
              OrderDetailsScreen(
                order: order,
              ),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color.fromRGBO(239, 238, 238, 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(
              AppSizes.getProportionateScreenWidth(5),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: AppSizes.getProportionateScreenWidth(40),
                          child: CachedNetworkImage(
                            imageUrl: order.merchant!.logo ?? '',
                          ),
                        ),
                        SpaceW(inputWidth: 5),
                        SizedBox(
                          width: AppSizes.screenWidth * 0.42,
                          child: Text(
                            order.merchant!.name ?? '',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: AppColors.fontColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          AppStrings.detailsOrderWidget.translate(),
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.red,
                          size: 22.sp,
                        ),
                      ],
                    ),
                  ],
                ),
                SpaceH(inputHeigth: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.code,
                          color: Colors.grey,
                        ),
                        SpaceW(inputWidth: 5),
                        Text(
                          '#${order.id}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.date_range,
                          color: Colors.grey,
                        ),
                        SpaceW(inputWidth: 5),
                        Text(
                          DateFormat.yMMMd()
                              .format(DateTime.parse(order.createdAt ?? '')),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                order.items!.isNotEmpty? Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: order.items!.first.image!.isNotEmpty ?  order.items!.first.image!.first.toString() : '',
                        height: AppSizes.getProportionateScreenHeight(70),
                        width: AppSizes.getProportionateScreenHeight(70),
                      ),
                    ),
                    SpaceW(inputWidth: 10),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.items!.first.name.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.GrayColor112,
                            ),
                          ),
                          SpaceH(inputHeigth: 10),
                          Text(
                            '${order.items!.length}${AppStrings.product.translate()}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: AppColors.fontColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ) : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
