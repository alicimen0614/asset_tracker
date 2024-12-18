import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum AuthError {
  invalidEmail(ConstAppTexts.invalidEmailText),
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

  static AuthError fromFirebaseError(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        return AuthError.invalidEmail;
      case 'user-disabled':
        return AuthError.userDisabled;
      case 'user-not-found':
        return AuthError.userNotFound;
      case 'wrong-password':
        return AuthError.wrongPassword;
      case 'too-many-requests':
        return AuthError.tooManyRequests;
      case 'email-already-in-use':
        return AuthError.emailAlreadyInUse;
      case 'operation-not-allowed':
        return AuthError.operationNotAllowed;
      case 'weak-password':
        return AuthError.weakPassword;
      default:
        return AuthError.unknown;
    }
  }
}
