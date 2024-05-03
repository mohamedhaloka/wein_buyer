import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/view/user/section/presentation/controller/section_cubit.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../core/utils/app_sizes.dart';
import '../../../../../../../widgets/space_width.dart';
import '../../../../../../../widgets/tab_widget.dart';

class MainSectionWidget extends StatelessWidget {
  const MainSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSizes.screenWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TabWidget(),
            SpaceW(inputWidth: 10),
            BlocBuilder<SectionCubit, SectionState>(
              buildWhen: (previous, current) =>
                  previous != current || current is OnTapOnCategoryItemState,
              builder: (context, state) {
                return state is GetMainCatesLoading
                    ? const SizedBox()
                    : Row(
                        children: List.generate(
                          SectionCubit.of(context).listOfMainCates.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  AppSizes.getProportionateScreenWidth(5),
                            ),
                            child: InkWell(
                              onTap: () {
                                SectionCubit.of(context)
                                    .onTapOnCategoryItem(index);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppSizes.getProportionateScreenWidth(15),
                                  vertical:
                                      AppSizes.getProportionateScreenHeight(10),
                                ),
                                decoration: SectionCubit.of(context)
                                        .listOfMainCates[index]
                                        .isSelected!
                                    ? BoxDecoration(
                                        color: AppColors.primaryColor
                                            .withOpacity(0.07),
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColors.primaryColor,
                                          width: 1,
                                        ),
                                      )
                                    : null,
                                child: Text(
                                  SectionCubit.of(context)
                                          .listOfMainCates[index]
                                          .name ??
                                      '',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: SectionCubit.of(context)
                                            .listOfMainCates[index]
                                            .isSelected!
                                        ? AppColors.primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
