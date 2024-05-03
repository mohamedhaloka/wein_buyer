import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
    final dirPath = (await getTemporaryDirectory()).path;

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
      return Image.file(videoThumbnail!);
    }
    return const Icon(
      Icons.video_call,
      size: 35,
    );
  }
}
