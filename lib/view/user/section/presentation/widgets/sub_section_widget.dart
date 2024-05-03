import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';

import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/loading_indicator.dart';
import '../../../../../../../widgets/section_item.dart';
import '../../../../../../../widgets/space_height.dart';
import '../../../../../core/utils/app_strings.dart';
import '../controller/section_cubit.dart';

class SubSectionWidget extends StatelessWidget {
  const SubSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.getProportionateScreenWidth(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  AppStrings.subSectionWidget.translate(),
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SpaceH(inputHeigth: 15),
              BlocBuilder<SectionCubit, SectionState>(
                builder: (context, state) {
                  return SectionCubit.of(context).listOfSubCates.isEmpty
                      ? const SizedBox()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisExtent:
                                AppSizes.getProportionateScreenHeight(120),
                          ),
                          itemCount:
                              SectionCubit.of(context).listOfSubCates.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return SectionItem(
                              isSub: true,
                              category: SectionCubit.of(context)
                                  .listOfSubCates[index],
                            );
                          },
                        );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
