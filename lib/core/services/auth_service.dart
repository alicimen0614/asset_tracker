import 'package:asset_tracker/core/utils/enums/auth_error_enum.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw AuthError.fromFirebaseError(e);
    } catch (_) {
      throw AuthError.unknown;
    }
  }
}
