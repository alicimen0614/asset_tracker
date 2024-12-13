import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/utils/mixins/regexp_mixins.dart';

final class LoginValidator {
  String? validateEmail(String? value) {
    RegExp regExp = RegExp(RegexpMixins.emailRegexp);

    if (value == null || value.isEmpty) {
      return ConstAppTexts.emailCantBeEmptyText;
    } else if (!regExp.hasMatch(value)) {
      return ConstAppTexts.invalidEmailAddressText;
    }
    return null;
  }

  String? validatePassword(String? value) {
    RegExp regExp = RegExp(RegexpMixins.passwordRegexp);
    if (value == null || value.isEmpty) {
      return ConstAppTexts.passwordCantBeEmptyText;
    } else if (!regExp.hasMatch(value)) {
      return ConstAppTexts.passwordLengthAlertText;
    }
    return null;
  }
}
