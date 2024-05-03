import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wein_buyer/core/notifications/notification_service.dart';
import 'package:wein_buyer/view/provider/bottom_nav_provider/presentation/screens/bottom_nav_provider_screen.dart';
import 'package:wein_buyer/view/select_lang/screens/select_lang_screen.dart';
import 'package:wein_buyer/view/user/bottom_nav_user/presentation/screens/bottom_nav_user_screen.dart';
import '../../../../../../../core/appStorage/app_storage.dart';
import '../../../../../../../core/router/router.dart';
import '../../../../core/blocks/lang_cubit/lang_cubit.dart';
import '../widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _splashTimer() async {
    setupNotifications();
    Timer(const Duration(seconds: 2), () {
      String lang = AppStorage.getLangInfo;
      context.read<LangCubit>().onUpdateLanguage(lang);
      if (AppStorage.getUserInfo == null && AppStorage.getUserProviderInfo == null) {
        MagicRouter.navigateAndPopAll(const SelectLangScreen());
      } else {
        if(AppStorage.getUserType == 0){
          MagicRouter.navigateAndPopAll(BottomNavProviderScreen(
            selectedIndex: 0,
          ));
        }else{
          MagicRouter.navigateAndPopAll(BottomNavUserScreen(
            selectedIndex: 0,
          ));
        }
      }
    });
  }

  @override
  void initState() {
    _splashTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
