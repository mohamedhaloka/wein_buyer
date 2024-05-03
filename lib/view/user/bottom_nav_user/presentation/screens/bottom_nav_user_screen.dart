import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/appStorage/app_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/view/user/cart/presentation/screen/cart_screen.dart';
import 'package:wein_buyer/view/user/myAccount/presentation/screen/my_account_screen.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/screen/my_orders_screen.dart';

import '../../../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../home/presentation/screen/home_screen.dart';

class BottomNavUserScreen extends StatefulWidget {
  BottomNavUserScreen({Key? key, required this.selectedIndex})
      : super(key: key);

  int selectedIndex = 0;

  @override
  State<BottomNavUserScreen> createState() => _BottomNavUserScreenState();
}

class _BottomNavUserScreenState extends State<BottomNavUserScreen> {
  List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const MyOrdersScreen(),
    const MyAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
            label: tr(context, AppStrings.mainScreen),
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: tr(context, AppStrings.rubbishScreen),
            icon: const Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: tr(context, AppStrings.myOrder),
            icon: const Icon(Icons.wysiwyg_outlined),
          ),
          BottomNavigationBarItem(
            label: tr(context, AppStrings.myAccount),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: screens[widget.selectedIndex],
    );
  }
}
