import 'package:get_storage/get_storage.dart';
import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/models/currencies_model.dart';
import 'package:wein_buyer/core/models/user_provider_model.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';
import 'package:wein_buyer/view/select_user/presentation/screens/select_user_screen.dart';
import '../../widgets/snackBar.dart';
import '../dioHelper/dio_helper.dart';
import '../models/user_user_model.dart';
import '../router/router.dart';

abstract class AppStorage {
  static final GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  static UserUserModel? get getUserInfo {
    if (_box.hasData('user')) return UserUserModel.fromJson(_box.read('user'));
    return null;
  }

  static UserProviderModel? get getUserProviderInfo {
    if (_box.hasData('userProvider'))
      return UserProviderModel.fromJson(_box.read('userProvider'));
    return null;
  }

  static Currency? get getSelectedUserCurrency {
    if (_box.hasData('getSelectedUserCurrency')) {
      return Currency.fromJson(_box.read('getSelectedUserCurrency'));
    }else{
      return Currency(
        code: 'EGP'
      );
    }
  }

  static String? get getPassword {
    if (_box.hasData('password')) return _box.read('password');
    return null;
  }

  static String? get getLang {
    if (_box.hasData('lang')){
      return _box.read('lang');
    }else{
      return 'ar';
    }
  }

  static bool? get getOpenStatus {
    if (_box.hasData('openStatus')) return _box.read('openStatus');
    return null;
  }

  static int? get getUserType {
    if (_box.hasData('userType')) return _box.read('userType');
    return null;
  }

  static int? get currency {
    if (_box.hasData('currency')) return _box.read('currency');
    return null;
  }

  static bool get isLogged {
    if(getUserInfo != null || getUserProviderInfo != null){
      return true;
    }else{
      return false;
    }
  }

  static bool? get isVerified {
    if (_box.hasData('isVerified')) return _box.read('isVerified');
    return null;
  }

  static Future<void> cacheUserInfo(UserUserModel userModel) =>
      _box.write('user', userModel.toJson());

  static Future<void> cacheCurrency(int currencyId) =>
      _box.write('currency', currencyId);

  static Future<void> cacheUserProviderInfo(UserProviderModel userModel) =>
      _box.write('userProvider', userModel.toJson());

  static Future<void> cacheSelectedUserCurrency(Currency currencyModel) =>
      _box.write('getSelectedUserCurrency', currencyModel.toJson());

  static Future<void> cachePasswordUserInfo(String passwoed) =>
      _box.write('password', passwoed);

  static Future<void> cacheLang(String lang) =>
      _box.write('lang', lang);

  static Future<void> cacheUserType(int userType) =>
      _box.write('userType', userType);

  static Future<void> cacheOpenStatus(bool openStatus) =>
      _box.write('openStatus', openStatus);

  static Future<void> cacheIsVerified(bool isVerified) =>
      _box.write('isVerified', isVerified);

  static int get getUserId => getUserInfo!.user!.user!.id!;

  static int get getUserProviderId => getUserProviderInfo!.user!.user!.id!;

  static String get getPasswordUserInfo => getPassword!;
  static String get getLangInfo => getLang!;

  static int get getUserTypeInfo => getUserType!;

  static UserUserModel? get getUserData => getUserInfo;

  static UserProviderModel? get getUseProviderrData => getUserProviderInfo;

  static Currency? get getSelectedUserCurrencyData => getSelectedUserCurrency;

  static bool get getOpenStatusInfo => getOpenStatus ?? false;

  static bool get getIsVerifiedInfo => isVerified ?? true;

  static Future<void> signOut() async {
    await _box.erase();
    MagicRouter.navigateAndPopAll(const SelectUserScreen());
    showSnackBar(AppStrings.logoutMsg.translate());
  }

  static Future<void> deleteAccount() async {
    await _box.erase();
    MagicRouter.navigateAndPopAll(const SelectUserScreen());
    showSnackBar(AppStrings.deleteAccountMsg.translate());
  }
}
