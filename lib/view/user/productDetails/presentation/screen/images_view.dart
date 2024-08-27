import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_sizes.dart';

class ImagesView extends StatelessWidget {
  const ImagesView({Key? key, required this.images, this.initialIndex = 0}) : super(key: key);

  final List<String> images;
  final int initialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoViewGallery.builder(
            itemCount: images.length,
            pageController: PageController(initialPage: initialIndex),
            builder: (context, index) {
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(images[index]),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              );
            },
            scrollPhysics: const BouncingScrollPhysics(),
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
          ),
          PositionedDirectional(
            top: AppSizes.getProportionateScreenHeight(50),
            start: AppSizes.getProportionateScreenWidth(20),
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(AppSizes.getProportionateScreenHeight(5)),
                child: const Icon(Icons.arrow_back_sharp, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
