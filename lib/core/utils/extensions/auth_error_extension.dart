import '../enums/auth_error_enum.dart';

extension AuthErrorExtension on String {
  AuthError toAuthError() {
    switch (this) {
      case 'invalid-email':
        return AuthError.invalidEmail;
      case 'invalid-credential':
        return AuthError.invalidCredential;
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
