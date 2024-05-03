import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_assets.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';
import 'package:wein_buyer/view/provider/sizeGuide/presentation/controller/size_guide_cubit.dart';
import 'package:wein_buyer/widgets/custom_network_image.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import 'package:wein_buyer/widgets/space_width.dart';
import 'package:wein_buyer/widgets/tab_widget.dart';

import '../../../../../../core/models/size_guides_model.dart';
import 'edit_size_guide_bottom_sheet.dart';

class SizeGuideItem extends StatelessWidget {
  const SizeGuideItem({Key? key, required this.sizeGuides}) : super(key: key);

  final SizeGuides sizeGuides;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const TabWidget(),
                  SpaceW(inputWidth: 10),
                  Text(
                    sizeGuides.name ?? '',
                    style: TextStyle(
                      color: AppColors.fontColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.getProportionateScreenWidth(10),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,
                        color: AppColors.fontColor,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          builder: (BuildContext cont) {
                            return BlocProvider.value(
                              value: SizeGuideCubit.of(context),
                              child: EditSizeGuideBottomSheet(
                                sizeGuides: sizeGuides,
                              ),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.delete_forever_outlined,
                        color: AppColors.primaryColor,
                      ),
                      onPressed: () {
                        SizeGuideCubit.of(context)
                            .deleteSizeGuides(sizeGuides.id ?? 0);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SpaceH(inputHeigth: 20),
          Container(
            height: AppSizes.getProportionateScreenHeight(250),
            padding: EdgeInsets.all(
              AppSizes.getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: AppColors.GrayColor239,
              ),
            ),
            child: CustomNetworkImage(
              url: sizeGuides.image ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
