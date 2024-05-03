import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/view/provider/orders/presentation/screen/orders_screen.dart';
import 'package:wein_buyer/widgets/loading_indicator.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../account/presentation/screen/account_screen.dart';
import '../../../market/presentation/screen/market_screen.dart';
import '../../../utils/presentation/controller/utils_cubit.dart';
import 'review_account_screen.dart';

class BottomNavProviderScreen extends StatefulWidget {
  BottomNavProviderScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  int selectedIndex;

  @override
  State<BottomNavProviderScreen> createState() =>
      _BottomNavProviderScreenState();
}

class _BottomNavProviderScreenState extends State<BottomNavProviderScreen> {
  List<Widget> screens = [
    const OrdersScreen(),
    const MarketScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    UtilsCubit.of(context).getVerifiedStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UtilsCubit, UtilsState>(
      builder: (context, state) {
        if (UtilsCubit.of(context).isVre??true) {
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: widget.selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (int index) async {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
              items: [
                BottomNavigationBarItem(
                  label: AppStrings.orders.translate(),
                  icon: const Icon(Icons.wysiwyg_outlined),
                ),
                BottomNavigationBarItem(
                  label: AppStrings.myMarket.translate(),
                  icon: const Icon(Icons.store),
                ),
                BottomNavigationBarItem(
                  label: AppStrings.myAccount.translate(),
                  icon: const Icon(Icons.person),
                ),
              ],
            ),
            body: screens[widget.selectedIndex],
          );
        } else {
          return const ReviewAccountScreen();
        }
      },
    );
  }
}
