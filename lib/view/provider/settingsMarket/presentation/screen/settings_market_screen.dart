import 'package:flutter/material.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/widgets/custom_appbar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widget/settings_market_body.dart';

class SettingsMarketScreen extends StatelessWidget {
  const SettingsMarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: AppStrings.settingHeaderMarketWidget.translate(),
      ),
      body: const SettingsMarketBody(),
    );
  }
}
