import 'package:flutter/material.dart';
import 'package:info_popup/info_popup.dart';
import 'package:wein_buyer/core/localization/localization_methods.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/user/cart/presentation/screen/cart_screen.dart';
import 'package:wein_buyer/view/user/myAccount/presentation/screen/my_account_screen.dart';
import 'package:wein_buyer/view/user/myOrders/presentation/screen/my_orders_screen.dart';

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
      bottomNavigationBar: Container(
        width: context.screenWidth,
        height: 60,
        color: Colors.white,
        child: Row(
          children: [
            _BottomNavBarItemWidget(
              isActive: widget.selectedIndex == 0,
              onTap: () => setState(() => widget.selectedIndex = 0),
              title: tr(context, AppStrings.mainScreen),
              icon: Icons.home,
            ),
            _BottomNavBarItemWidget(
              isActive: widget.selectedIndex == 1,
              onTap: () => setState(() => widget.selectedIndex = 1),
              title: tr(context, AppStrings.rubbishScreen),
              icon: Icons.shopping_cart,
            ),
            _BottomNavBarItemWidget(
              isActive: widget.selectedIndex == 2,
              onTap: () => setState(() => widget.selectedIndex = 2),
              title: tr(context, AppStrings.myOrder),
              icon: Icons.wysiwyg_outlined,
            ),
            _BottomNavBarItemWidget(
              isActive: widget.selectedIndex == 3,
              onTap: () => setState(() => widget.selectedIndex = 3),
              title: tr(context, AppStrings.myAccount),
              icon: Icons.person,
            ),
          ],
        ),
      ),
      body: screens[widget.selectedIndex],
    );
  }
}

//BottomNavigationBar(
//         currentIndex: widget.selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: (int index) async {
//           setState(() {
//             widget.selectedIndex = index;
//           });
//         },
//         selectedItemColor: AppColors.primaryColor,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         selectedLabelStyle: TextStyle(
//           color: AppColors.primaryColor,
//           fontSize: 14.sp,
//           fontWeight: FontWeight.bold,
//         ),
//         items: [
//           BottomNavigationBarItem(
//             label: tr(context, AppStrings.mainScreen),
//             icon: const Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             label: tr(context, AppStrings.rubbishScreen),
//             icon: const Icon(Icons.shopping_cart),
//           ),
//           BottomNavigationBarItem(
//             label: tr(context, AppStrings.myOrder),
//             icon: const Icon(Icons.wysiwyg_outlined),
//           ),
//           BottomNavigationBarItem(
//             label: tr(context, AppStrings.myAccount),
//             icon: const Icon(Icons.person),
//           ),
//         ],
//       )

class _BottomNavBarItemWidget extends StatelessWidget {
  const _BottomNavBarItemWidget({
    required this.isActive,
    required this.onTap,
    required this.icon,
    required this.title,
  });
  final IconData icon;
  final String title;
  final void Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: isActive ? AppColors.primaryColor : Colors.transparent,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isActive ? AppColors.primaryColor : null,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: isActive ? AppColors.primaryColor : null,
                      fontWeight: isActive ? FontWeight.bold : null,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
