import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';

import '../../../../../../../core/utils/app_assets.dart';

class ImageSliderWidget extends StatefulWidget {
  const ImageSliderWidget({Key? key, required this.slider}) : super(key: key);

  final List<String> slider;

  @override
  State<ImageSliderWidget> createState() => _ImageSliderWidgetState();
}

class _ImageSliderWidgetState extends State<ImageSliderWidget> {
  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppSizes.screenHeight * 0.2,
          width: AppSizes.screenWidth,
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              disableCenter: true,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
            items: widget.slider
                .map((item) => CachedNetworkImage(
                      imageUrl: item,
                      fit: BoxFit.fill,
                    ))
                .toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.slider.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0.sp,
                height: 12.0.sp,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : _current == entry.key
                          ? Colors.blue
                          : Colors.black26),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
