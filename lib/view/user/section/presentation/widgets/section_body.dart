import 'package:flutter/material.dart';
import 'package:wein_buyer/view/user/section/presentation/widgets/main_section_widget.dart';
import 'package:wein_buyer/view/user/section/presentation/widgets/sub_section_widget.dart';
import 'package:wein_buyer/view/user/section/presentation/widgets/top_rate_widget.dart';
import 'package:wein_buyer/widgets/space_height.dart';
import '../../../../../../../core/utils/app_sizes.dart';

class SectionBody extends StatelessWidget {
  const SectionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.getProportionateScreenHeight(15),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MainSectionWidget(),
            SpaceH(inputHeigth: 10),
            const SubSectionWidget(),
            const TopRateWidget(),
          ],
        ),
      ),
    );
  }
}