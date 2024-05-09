import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';

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
        Container(
          height: AppSizes.screenHeight * 0.2,
          width: AppSizes.screenWidth,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              spreadRadius: 6,
              blurRadius: 8,
              color: Colors.grey.withOpacity(.3),
            )
          ]),
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
                width: 8.0.sp,
                height: 8.0.sp,
                margin:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : _current == entry.key
                          ? Colors.black
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
