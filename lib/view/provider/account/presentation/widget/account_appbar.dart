import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/view/notification/presentation/screen/notification_screen.dart';

import '../../../../../../core/router/router.dart';
import '../../../../../../core/utils/app_sizes.dart';
import '../../../../../core/utils/app_strings.dart';

class AccountAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AccountAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        AppStrings.myAccount.translate(),
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            MagicRouter.navigateTo(const NotificationScreen());
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.getProportionateScreenWidth(20),
              vertical: AppSizes.getProportionateScreenHeight(5),
            ),
            child: Container(
              padding: EdgeInsets.all(AppSizes.getProportionateScreenWidth(12)),
              decoration: BoxDecoration(
                color: AppColors.GrayColor239,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
