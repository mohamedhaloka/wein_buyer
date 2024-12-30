import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/products_provider_model.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_func.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/image_view.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/media_view.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../user/productDetails/presentation/screen/video_view.dart';
import '../../controller/add_product_cubit.dart';

class ImagesEditProduct extends StatelessWidget {
  const ImagesEditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
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
          buildWhen: (previous, current) =>
              current is SelectListOfImage ||
              current is SelectListOfImageNetwork ||
              current is DeleteImageLoaded,
          builder: (context, state) {
            List<File> listOfImages = AddProductCubit.of(context).listOfImages;
            List<Files> listOfImagesNetwork =
                AddProductCubit.of(context).listOfImagesNetwork;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(listOfImagesNetwork.length, (index) {
                    return Stack(
                      children: [
                        listOfImagesNetwork[index].type!.split('.').last !=
                                'video'
                            ? InkWell(
                                onTap: () => MagicRouter.navigateTo(MediaView(
                                  items: listOfImagesNetwork.map((e) {
                                    if (e.type == 'video') {
                                      return MediaItem.video(src: e.file!);
                                    }
                                    return MediaItem.img(src: e.file!);
                                  }).toList(),
                                )),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppSizes.getProportionateScreenWidth(3),
                                    vertical:
                                        AppSizes.getProportionateScreenHeight(
                                            10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      listOfImagesNetwork[index].file ?? '',
                                      height:
                                          AppSizes.getProportionateScreenHeight(
                                              80),
                                      width:
                                          AppSizes.getProportionateScreenHeight(
                                              80),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () => MagicRouter.navigateTo(MediaView(
                                  items: listOfImagesNetwork.map((e) {
                                    if (e.type == 'video') {
                                      return MediaItem.video(src: e.file!);
                                    }
                                    return MediaItem.img(src: e.file!);
                                  }).toList(),
                                )),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        AppSizes.getProportionateScreenWidth(3),
                                    vertical:
                                        AppSizes.getProportionateScreenHeight(
                                            10),
                                  ),
                                  height:
                                      AppSizes.getProportionateScreenHeight(80),
                                  width:
                                      AppSizes.getProportionateScreenHeight(80),
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
                              ),
                        Positioned(
                          top: 5,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              AddProductCubit.of(context).deleteImage(
                                  listOfImagesNetwork[index].file ?? '');
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
                  ...List.generate(listOfImages.length, (index) {
                    return Stack(
                      children: [
                        !AppFunc.checkIsVideo(path: listOfImages[index].path)
                            ? InkWell(
                                onTap: () => MagicRouter.navigateTo(
                                  MediaView(
                                    items: listOfImagesNetwork.map((e) {
                                      if (e.type == 'video') {
                                        return MediaItem.video(src: e.file!);
                                      }
                                      return MediaItem.img(src: e.file!);
                                    }).toList(),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppSizes.getProportionateScreenWidth(3),
                                    vertical:
                                        AppSizes.getProportionateScreenHeight(
                                            10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      listOfImages[index],
                                      height:
                                          AppSizes.getProportionateScreenHeight(
                                              80),
                                      width:
                                          AppSizes.getProportionateScreenHeight(
                                              80),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : InkWell(
                                onTap: () => MagicRouter.navigateTo(
                                  MediaView(
                                    items: listOfImagesNetwork.map((e) {
                                      if (e.type == 'video') {
                                        return MediaItem.video(src: e.file!);
                                      }
                                      return MediaItem.img(src: e.file!);
                                    }).toList(),
                                  ),
                                ),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        AppSizes.getProportionateScreenWidth(3),
                                    vertical:
                                        AppSizes.getProportionateScreenHeight(
                                            10),
                                  ),
                                  height:
                                      AppSizes.getProportionateScreenHeight(80),
                                  width:
                                      AppSizes.getProportionateScreenHeight(80),
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
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
