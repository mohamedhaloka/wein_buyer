import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/user/productDetails/presentation/screen/video_view.dart';

class VideoThumbnailWidget extends StatefulWidget {
  const VideoThumbnailWidget(this.fileUrl, {super.key});
  final String? fileUrl;

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  File? videoThumbnail;
  bool isLoading = true;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if ((widget.fileUrl ?? '').isEmpty) {
        isLoading = false;
        setState(() {});
        return;
      }
      getVideoThumbnail(widget.fileUrl!);
    });
    super.initState();
  }

  void getVideoThumbnail(String url) async {
    final dirPath = (await getApplicationCacheDirectory()).path;
    final fileUrlName = basename(widget.fileUrl!);

    if (File(dirPath + fileUrlName).existsSync()) {
      videoThumbnail = File(dirPath + fileUrlName);
      isLoading = false;

      setState(() {});

      return;
    }

    final fileName = await VideoThumbnail.thumbnailFile(
      video: url,
      thumbnailPath: dirPath,
      imageFormat: ImageFormat.WEBP,
      quality: 50,
    );

    log('File name $fileName');
    if (fileName == null) return;
    videoThumbnail = File(fileName);
    isLoading = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.5),
        highlightColor: Colors.grey.withOpacity(.2),
        child: const Icon(
          Icons.video_call,
          size: 35,
        ),
      );
    }

    if (videoThumbnail != null) {
      return InkWell(
        onTap: () => MagicRouter.navigateTo(
          VideoView(videoUrl: widget.fileUrl ?? '',),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.file(
              videoThumbnail!,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black.withOpacity(.5),
                child: const Icon(
                  Icons.play_arrow,
                  color: AppColors.primaryColor,
                ),
              ),
            )
          ],
        ),
      );
    }
    return const Icon(
      Icons.video_call,
      size: 35,
    );
  }
}
