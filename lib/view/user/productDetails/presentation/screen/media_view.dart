import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/video_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_sizes.dart';

class MediaItem {
  final String src;
  final MediaType type;

  const MediaItem.img({required this.src}) : type = MediaType.image;
  const MediaItem.video({required this.src}) : type = MediaType.video;
}

enum MediaType {
  image,
  video;
}

class MediaView extends StatelessWidget {
  const MediaView({Key? key, required this.items}) : super(key: key);

  final List<MediaItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              if (items[index].type == MediaType.image) {
                return PhotoView(
                  imageProvider: NetworkImage(items[index].src),
                );
              }

              return VideoView(
                videoUrl: items[index].src,
              );
            },
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
                padding:
                    EdgeInsets.all(AppSizes.getProportionateScreenHeight(5)),
                child: const Icon(
                  Icons.arrow_back_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
