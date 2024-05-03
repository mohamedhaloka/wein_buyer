import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/size_guides_model.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/sizeGuide/presentation/controller/size_guide_cubit.dart';
import 'package:wein_buyer/widgets/custom_button.dart';
import 'package:wein_buyer/widgets/input_form_field.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';
import 'package:wein_buyer/widgets/space_height.dart';

import '../../../../../../core/utils/app_sizes.dart';

class EditSizeGuideBottomSheet extends StatelessWidget {
  const EditSizeGuideBottomSheet({Key? key, required this.sizeGuides})
      : super(key: key);

  final SizeGuides sizeGuides;

  @override
  Widget build(BuildContext context) {
    SizeGuideCubit.of(context).nameOfSizeGuideController.text =
        sizeGuides.name ?? '';
    return WillPopScope(
      onWillPop: () async {
        SizeGuideCubit.of(context).nameOfSizeGuideController.clear();
        SizeGuideCubit.of(context).imageSizeGuide = null;
        return true;
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: AppSizes.screenHeight * 0.35,
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.getProportionateScreenHeight(10),
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SpaceH(inputHeigth: 5),
                Text(
                  AppStrings.editeMap.translate(),
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SpaceH(inputHeigth: 20),
                InputFormField(
                  hint: AppStrings.namedMap.translate(),
                  textColor: AppColors.fontColor,
                  controller:
                      SizeGuideCubit.of(context).nameOfSizeGuideController,
                  validator: (v) {},
                ),
                SpaceH(inputHeigth: 10),
                BlocBuilder<SizeGuideCubit, SizeGuideState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        SizeGuideCubit.of(context).selectedImage();
                      },
                      child: Container(
                        width: AppSizes.screenWidth,
                        height: AppSizes.getProportionateScreenHeight(50),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.getProportionateScreenWidth(10),
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              SizeGuideCubit.of(context).imageSizeGuide != null
                                  ? SizeGuideCubit.of(context)
                                      .imageSizeGuide!
                                      .path
                                      .split('/')
                                      .last
                                  : AppStrings.addAddSizeGuideBottomSheet.translate(),
                              style: const TextStyle(
                                color: AppColors.fontColor,
                                fontSize: 14,
                              ),
                            ),
                            const Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SpaceH(inputHeigth: 15),
                BlocBuilder<SizeGuideCubit, SizeGuideState>(
                  builder: (context, state) {
                    return state is EditSizeGuideLoading
                        ? const LoadingIndicator()
                        : CustomButton(
                            text: AppStrings.addAddSizeGuideBottomSheet.translate(),
                            radius: 10,
                            onPress: () {
                              SizeGuideCubit.of(context).editSizeGuides(sizeGuides.id??0);
                            },
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
