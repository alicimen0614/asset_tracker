import 'package:asset_tracker/core/constants/const_app_texts.dart';
import 'package:asset_tracker/core/services/auth_service.dart';
import 'package:asset_tracker/data/models/user_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../core/utils/enums/auth_error_enum.dart';

class MockAuthService implements AuthService {
  MockAuthService();

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final mockUserEmail = dotenv.env[ConstAppTexts.mockUserEmailAccessText];
      final mockUserPassword =
          dotenv.env[ConstAppTexts.mockUserPasswordAccessText];

      if (email == mockUserEmail && password == mockUserPassword) {
        await Future.delayed(const Duration(seconds: 1));
        return AuthUser(email: email, password: password);
      } else {
        throw AuthError.invalidCredential;
      }
    } on AuthError catch (_) {
      rethrow;
    } catch (_) {
      throw AuthError.unknown;
    }
  }
}
