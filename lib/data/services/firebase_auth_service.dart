import 'package:asset_tracker/core/services/auth_service.dart';
import 'package:asset_tracker/core/utils/extensions/auth_error_extension.dart';
import 'package:asset_tracker/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/utils/enums/auth_error_enum.dart';

class FirebaseAuthService implements AuthService {
  final FirebaseAuth _auth;

  FirebaseAuthService(this._auth);

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return AuthUser(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw e.code.toAuthError();
    } catch (_) {
      throw AuthError.unknown;
    }
  }
}
