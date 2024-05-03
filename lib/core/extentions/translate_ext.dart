import 'package:wein_buyer/core/router/router.dart';
import '../localization/localization_methods.dart';

extension Translate on String {
  String translate() => tr(navigatorKey.currentContext!, this);
}
