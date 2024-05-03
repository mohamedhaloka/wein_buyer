import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/cart_model.dart';
import 'package:wein_buyer/view/user/cart/presentation/controller/cart_cubit.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../core/appStorage/app_storage.dart';
import '../../../../../core/utils/app_strings.dart';

class CartItem extends StatelessWidget {
  const CartItem({Key? key, required this.items}) : super(key: key);

  final Items items;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          previous != current || current is UpdateItemQuantityLoaded,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(5),
            horizontal: AppSizes.getProportionateScreenWidth(20),
          ),
          child: Container(
            height: AppSizes.getProportionateScreenHeight(110),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(251, 251, 251, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(
              AppSizes.getProportionateScreenWidth(8),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: items.product!.files!.first.type == 'video'
                      ? const Icon(
                          Icons.video_call,
                          size: 35,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: items.product!.images!.isNotEmpty
                                ? items.product!.images!.first
                                : '',
                          ),
                        ),
                ),
                SpaceW(inputWidth: 10),
                Expanded(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items.product!.name ?? '',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.fontColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "${items.product!.priceAfterDiscount}",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.fontColor,
                                    ),
                                  ),
                                  Text(
                                    items.product!.currency ?? '',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.fontColor,
                                    ),
                                  ),
                                ],
                              ),
                              SpaceW(inputWidth: 2),
                              Text(
                                '${items.product!.price ?? ''} ${items.product!.currency}',
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.GrayColor112,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(
                              AppSizes.getProportionateScreenWidth(5),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    CartCubit.of(context).updateItemQuantity(
                                        items.itemId ?? '', 1);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(
                                      AppSizes.getProportionateScreenWidth(5),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SpaceW(inputWidth: 18),
                                Text(
                                  "${items.quantity}",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.fontColor,
                                  ),
                                ),
                                SpaceW(inputWidth: 18),
                                items.quantity != 1
                                    ? InkWell(
                                        onTap: () {
                                          print("1");
                                          CartCubit.of(context)
                                              .updateItemQuantity(
                                                  items.itemId ?? '', -1);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            AppSizes
                                                .getProportionateScreenWidth(5),
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                253, 243, 243, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          CartCubit.of(context)
                                              .removeItem(items.itemId ?? '');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(
                                            AppSizes
                                                .getProportionateScreenWidth(5),
                                          ),
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                253, 243, 243, 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Icon(
                                            Icons.delete,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
