import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../controller/add_product_cubit.dart';

class ImagesAddProduct extends StatelessWidget {
  const ImagesAddProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          // onTap: () => AppFunc.pickAndCompressVideo(),
          onTap: () => AddProductCubit.of(context).selectListOfImage(context),
          child: Container(
            width: AppSizes.screenWidth,
            height: AppSizes.getProportionateScreenHeight(50),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(10),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.addImages.translate(),
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
        ),
        BlocBuilder<AddProductCubit, AddProductState>(
          buildWhen: (previous, current) => current is SelectListOfImage,
          builder: (context, state) {
            List<File> listOfImages = AddProductCubit.of(context).listOfImages;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(listOfImages.length, (index) {
                  return Stack(
                    children: [
                      !AppFunc.checkIsVideo(path: listOfImages[index].path)
                          ? Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    AppSizes.getProportionateScreenWidth(3),
                                vertical:
                                    AppSizes.getProportionateScreenHeight(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  listOfImages[index],
                                  height:
                                      AppSizes.getProportionateScreenHeight(80),
                                  width:
                                      AppSizes.getProportionateScreenHeight(80),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(
                              margin: EdgeInsets.symmetric(
                                horizontal:
                                    AppSizes.getProportionateScreenWidth(3),
                                vertical:
                                    AppSizes.getProportionateScreenHeight(10),
                              ),
                              height: AppSizes.getProportionateScreenHeight(80),
                              width: AppSizes.getProportionateScreenHeight(80),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              child: const Icon(
                                Icons.video_call,
                                size: 35,
                              ),
                            ),
                      Positioned(
                        top: 5,
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            AddProductCubit.of(context).clearImageItem(index);
                          },
                          child: Container(
                            width: AppSizes.getProportionateScreenWidth(25),
                            height: AppSizes.getProportionateScreenWidth(25),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.3),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primaryColor,
                              ),
                            ),
                            child: const Icon(
                              Icons.clear,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            );
          },
        ),
      ],
    );
  }
}
