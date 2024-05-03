import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/view/provider/sizeGuide/presentation/widget/size_guide_list_widget.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../controller/size_guide_cubit.dart';
import 'empty_list_widget.dart';

class SizeGuideBody extends StatelessWidget {
  const SizeGuideBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SizeGuideCubit, SizeGuideState>(
      buildWhen: (previous, current) =>
          previous != current || current is DeleteSizeGuideLoaded,
      builder: (context, state) {
        return state is GetSizeGuideLoading
            ? const LoadingIndicator()
            : SizeGuideCubit.of(context).listOfSizeGuide.isEmpty
                ? const EmptyListWidget()
                : SizeGuideListWidget(
                    listOfSizeGuide: SizeGuideCubit.of(context).listOfSizeGuide,
                  );
      },
    );
  }
}
