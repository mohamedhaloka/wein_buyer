import 'dart:io';

import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoThumbnailWidget extends StatefulWidget {
  const VideoThumbnailWidget(this.url, {super.key});
  final String? url;

  @override
  State<VideoThumbnailWidget> createState() => _VideoThumbnailWidgetState();
}

class _VideoThumbnailWidgetState extends State<VideoThumbnailWidget> {
  VideoPlayerController? _controller;

  File? selectedVideoFile;
  String? selectedVideoUrl;

  BaseStatus _fetchVideoDetails = BaseStatus.initial;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.url != null) {
        selectedVideoUrl = widget.url;
        setState(() {});
      }

      if (widget.url == null) return;

      _getVideoDetails();
    });
  }

  String get _url => widget.url ?? '';

  void _getVideoDetails() async {
    _fetchVideoDetails = BaseStatus.inProgress;
    setState(() {});

    _controller = (selectedVideoUrl != null
        ? VideoPlayerController.networkUrl(
            Uri.parse(_url),
          )
        : VideoPlayerController.file(
            selectedVideoFile!,
          ))
      ..initialize().then((_) {
        _fetchVideoDetails = BaseStatus.success;
        setState(() {});
      }).catchError((e) {
        dev.log('video error $e');
        _fetchVideoDetails = BaseStatus.failure;
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Container(
                child: _controller == null
                    ? null
                    : Center(
                        child: AspectRatio(
                          aspectRatio: _controller?.value.aspectRatio ?? 1,
                          child: VideoPlayer(_controller!),
                        ),
                      ),
              ),
            ),
          ),
          if (_fetchVideoDetails.isInProgress)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const CircularProgressIndicator(),
                ),
              ),
            ),
          if (_fetchVideoDetails.isFailure)
            const Positioned(
              left: 20,
              right: 20,
              child: Center(
                child: Icon(Icons.info),
              ),
            ),
        ],
      ),
    );
  }
}

enum BaseStatus {
  initial,
  inProgress,
  success,
  failure;

  const BaseStatus();
}

extension BaseStatusFunctionality on BaseStatus {
  bool get isInitial => this == BaseStatus.initial;
  bool get isSuccess => this == BaseStatus.success;
  bool get isInProgress => this == BaseStatus.inProgress;
  bool get isFailure => this == BaseStatus.failure;
}
