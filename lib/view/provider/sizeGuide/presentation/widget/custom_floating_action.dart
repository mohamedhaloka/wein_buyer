import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../controller/size_guide_cubit.dart';
import 'add_size_guide_bottom_sheet.dart';

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primaryColor,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          builder: (BuildContext cont) {
            return BlocProvider.value(
              value: SizeGuideCubit.of(context),
              child: const AddSizeGuideBottomSheet(),
            );
          },
        );
      },
    );
  }
}
