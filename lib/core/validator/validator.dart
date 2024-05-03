import 'package:wein_buyer/core/extentions/translate_ext.dart';
import 'package:wein_buyer/core/utils/app_strings.dart';

class Validator {
  static String? noValidator(String value) {
    return '';
  }

  static String? generalField(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else
      return null;
  }

  static String? email(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (!value.contains('@') || !value.contains('.'))
      return 'EX: example@mail.com';
    else
      return null;
  }

  static String? phoneNumber(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    // else if (!value.startsWith('01'))
    //   return 'رقم الجوال يجب ان يبدأ بالرقم 01';
    else
      return null;
  }

  static String? pinCode(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length != 4)
      return AppStrings.pinCodeValidator;
    else
      return null;
  }

  static String? password(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 3)
      return AppStrings.passwordValidator.translate();
    else
      return null;
  }

  static String? confirmPassword(String value, String password) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 6)
      return AppStrings.confirmPasswordValidator.translate();
    else if (password != value)
      return AppStrings.confirmPasswordMismatchValidator.translate();
    else
      return null;
  }

  static String? name(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 2)
      return AppStrings.nameValidator.translate();
    else
      return null;
  }

  static String? notes(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else
      return null;
  }

  static String? enquiry(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 10 || value.length > 3000)
      return AppStrings.enquiryValidator.translate();
    else
      return null;
  }

  static String? search(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else
      return null;
  }

  static String? address(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 10 || value.length > 50)
      return AppStrings.addressValidator.translate();
    else
      return null;
  }

  static String? day(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return AppStrings.wrongContent.translate();
    else if (int.parse(value) < 1 || int.parse(value) > 31)
      return '1 - 31';
    else if (value.length > 2)
      return AppStrings.wrongContent.translate();
    else
      return null;
  }

  static String? month(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return AppStrings.wrongContent.translate();
    else if (int.parse(value) < 1 || int.parse(value) > 12)
      return '1 - 12';
    else if (value.length > 2)
      return AppStrings.wrongContent.translate();
    else
      return null;
  }

  static String? year(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.contains('.') ||
        value.contains(',') ||
        value.contains('-') ||
        value.contains('_'))
      return AppStrings.wrongContent.translate();
    else if (int.parse(value) < 1950 || int.parse(value) > 2020)
      return '1950 - 2020';
    else if (value.length > 4)
      return AppStrings.wrongContent.translate();
    else
      return null;
  }

  static String? comment(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 25)
      return AppStrings.commentValidator.translate();
    else
      return null;
  }

  static String? report(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 5)
      return AppStrings.reportValidator.translate();
    else
      return null;
  }

  static String? productTitle(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 4)
      return AppStrings.productTitleValidator.translate();
    else
      return null;
  }

  static String? productDetails(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else if (value.length < 10)
      return AppStrings.productDetailsValidator.translate();
    else
      return null;
  }

  static String? productPrice(String value) {
    if (value.isEmpty)
      return AppStrings.emptyField.translate();
    else
      return null;
  }
}