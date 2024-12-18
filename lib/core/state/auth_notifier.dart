import 'package:asset_tracker/core/models/auth_state_model.dart';
import 'package:asset_tracker/core/services/auth_service.dart';
import 'package:asset_tracker/core/utils/enums/auth_error_enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService = AuthService();
  AuthNotifier() : super(const AuthState());

  Future<bool> signIn({required String email, required String password}) async {
    state = state.copyWith(isLoading: true, error: null);
    try {
      final userCredential = await _authService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      state = state.copyWith(user: userCredential?.user, isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(error: e as AuthError, isLoading: false);
      return false;
    }
  }
}
