import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/router/router.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/dynamic_link_provider.dart';

class ProductDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  ProductDetailsAppBar({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        AppStrings.detailsProduct.translate(),
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20.sp,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {
            DynamicLinkProvider()
                .createLink(pro: true, id: id.toString())
                .then((value) {
              Share.share(value);
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart_checkout),
          onPressed: () {
            MagicRouter.navigateAndPopAll(
                BottomNavUserScreen(selectedIndex: 1));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
