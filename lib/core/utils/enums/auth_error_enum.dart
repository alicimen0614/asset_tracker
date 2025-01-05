import 'package:asset_tracker/core/constants/const_app_texts.dart';

enum AuthError {
  invalidEmail(ConstAppTexts.invalidEmailText),
  invalidCredential(ConstAppTexts.invalidCredentialText),
  userDisabled(ConstAppTexts.userDisabledText),
  userNotFound(ConstAppTexts.userNotFoundText),
  wrongPassword(ConstAppTexts.wrongPasswordText),
  tooManyRequests(ConstAppTexts.tooManyRequestsText),
  networkError(ConstAppTexts.networkErrorText),
  emailAlreadyInUse(ConstAppTexts.emailAlreadyInUseText),
  operationNotAllowed(ConstAppTexts.operationNotAllowedText),
  weakPassword(ConstAppTexts.weakPasswordText),
  unknown(ConstAppTexts.unknownErrorText);

  final String message;
  const AuthError(this.message);
}
