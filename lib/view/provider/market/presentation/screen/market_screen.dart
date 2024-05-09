import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/provider/market/presentation/controller/market_cubit.dart';
import 'package:wein_buyer/view/provider/product/presentation/screen/add_product_screen.dart';
import 'package:wein_buyer/widgets/space_width.dart';

import '../../../../../../core/services/services_locator.dart';
import '../widget/market_body.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketCubit(sl(), sl(), sl(), sl(), sl(), sl())
        ..getHeaderData()
        ..getProfileData()
        ..getMyRates(),
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.primaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          elevation: 0.0,
          label: Row(
            children: [
              const Icon(
                Icons.add,
                color: Colors.white,
              ),
              SpaceW(inputWidth: 5),
              Text(
                AppStrings.addMarketScreen.translate(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onPressed: () {
            MagicRouter.navigateTo(const AddProductScreen());
          },
        ),
        body: const MarketBody(),
      ),
    );
  }
}
