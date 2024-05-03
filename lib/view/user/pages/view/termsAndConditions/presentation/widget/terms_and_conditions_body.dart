import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_sizes.dart';

import '../../../../../../../../../widgets/loading_indicator.dart';
import '../../../controller/pages_cubit.dart';

class TermsAndConditionsBody extends StatelessWidget {
  const TermsAndConditionsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.getProportionateScreenWidth(15),
      ),
      child: BlocBuilder<PagesCubit, PagesState>(
        builder: (context, state) {
          return state is GetTermsLoading
              ? const LoadingIndicator()
              : Text(
                  PagesCubit.of(context).termsModel!.body!.content ?? '',
                  style: TextStyle(
                    color: AppColors.fontColor,
                    fontSize: 14.sp,
                    wordSpacing: 4.w,
                    height: 1.25.h,
                  ),
                );
        },
      ),
    );
  }
}
