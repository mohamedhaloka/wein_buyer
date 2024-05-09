import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/blocks/lang_cubit/lang_cubit.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_sizes.dart';

class TabWidget extends StatelessWidget {
  const TabWidget({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? AppSizes.getProportionateScreenWidth(6),
      height: height ?? AppSizes.getProportionateScreenHeight(50),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius:
            context.read<LangCubit>().state.locale.languageCode == 'ar'
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
      ),
    );
  }
}
