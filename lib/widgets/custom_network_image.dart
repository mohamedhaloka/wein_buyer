import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/utils/app_assets.dart';

class CustomNetworkImage extends StatelessWidget {
  CustomNetworkImage({
    Key? key,
    required this.url,
    this.height,
    this.width,
  }) : super(key: key);

  final String url;
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      child: CachedNetworkImage(
        imageUrl: url,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        placeholder: (context, url) => Center(
          child: Lottie.asset(AppAssets.loadingLottie),
        ),
      ),
    );
  }
}
