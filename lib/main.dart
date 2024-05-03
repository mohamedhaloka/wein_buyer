import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wein_buyer/core/utils/app_colors.dart';
import 'package:wein_buyer/core/utils/dynamic_link_provider.dart';
import 'package:wein_buyer/view/provider/settingsMarket/presentation/controller/setting_market_cubit.dart';
import 'package:wein_buyer/view/provider/utils/presentation/controller/utils_cubit.dart';
import 'core/appStorage/app_storage.dart';
import 'core/blocks/lang_cubit/lang_cubit.dart';
import 'core/localization/set_localization.dart';
import 'core/router/router.dart';
import 'core/services/services_locator.dart';
import 'core/utils/app_sizes.dart';
import 'view/splash/presentation/screens/splash_screen.dart';
import 'view/user/favorites/presentation/controller/favorites_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DynamicLinkProvider().initDynamicLink();
  ServicesLocator().init();
  AppStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LangCubit(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    SettingMarketCubit(sl())..cacheOpenStatus(),
              ),
              BlocProvider(
                create: (context) => UtilsCubit(sl(), sl())..getSizes(),
              ),
              BlocProvider(
                create: (context) => FavoritesCubit(sl(), sl(), sl()),
              ),
            ],
            child: BlocBuilder<LangCubit, LangState>(
              builder: (context, stateLang) {
                return BlocProvider(
                  create: (context) => FavoritesCubit(sl(), sl(), sl()),
                  child: MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: const SplashScreen(),
                    onGenerateRoute: onGenerateRoute,
                    navigatorKey: navigatorKey,
                    theme: ThemeData(
                      fontFamily: 'Almarai',
                      scaffoldBackgroundColor: Colors.white,
                      appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(
                          color: AppColors.fontColor,
                        ),
                      ),
                      snackBarTheme: const SnackBarThemeData(
                        actionTextColor: Colors.white,
                        backgroundColor: AppColors.primaryColor,
                        contentTextStyle: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    supportedLocales: const [
                      Locale('en', 'US'),
                      Locale('ar', 'EG')
                    ],
                    localizationsDelegates: const [
                      SetLocalization.localizationsDelegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    locale: stateLang.locale,
                    builder: (context, child) {
                      AppSizes().init(context);
                      return Directionality(
                        textDirection: stateLang.locale.languageCode == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: child!,
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
