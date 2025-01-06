import 'package:asset_tracker/data/models/user_model.dart';

abstract class AuthService {
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}
