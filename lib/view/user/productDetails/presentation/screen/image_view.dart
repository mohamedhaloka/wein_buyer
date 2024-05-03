import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_sizes.dart';

class ImageView extends StatelessWidget {
  const ImageView({Key? key, required this.img}) : super(key: key);

  final String img;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PhotoView(
            imageProvider: NetworkImage(img),
          ),
          PositionedDirectional(
            top: AppSizes.getProportionateScreenHeight(50),
            start: AppSizes.getProportionateScreenWidth(20),
            child: InkWell(
              onTap: ()=> Navigator.of(context).pop(),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(AppSizes.getProportionateScreenHeight(5)),
                child: const Icon(Icons.arrow_back_sharp , color: Colors.white,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
