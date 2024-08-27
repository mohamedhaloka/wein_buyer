import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../../../../core/models/product.dart';
import '../../../../../core/utils/app_sizes.dart';
import '../screen/image_view.dart';
import '../screen/video_view.dart';

class ImageItem extends StatefulWidget {
  const ImageItem({
    Key? key,
    required this.item,
    this.enableGesture = true,
  }) : super(key: key);
  final Files item;
  final bool enableGesture;

  @override
  State<ImageItem> createState() => _ImageItemState();
}

class _ImageItemState extends State<ImageItem> {
  @override
  Widget build(BuildContext context) {
    if (widget.item.type == 'video') {
      return GestureDetector(
        onTap: widget.enableGesture
            ? () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    VideoView(videoUrl: widget.item.file ?? '')))
            : null,
        child: SizedBox(
          width: AppSizes.screenWidth,
          child: const Icon(
            Icons.video_call,
            size: 50,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: widget.enableGesture
            ? () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImageView(
                      img: widget.item.file ?? '',
                    )))
            : null,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: widget.item.file ?? '',
          ),
        ),
      );
    }
  }
}
