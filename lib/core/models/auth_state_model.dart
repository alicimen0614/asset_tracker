import 'package:asset_tracker/core/utils/enums/auth_error_enum.dart';
import 'package:asset_tracker/data/models/user_model.dart';

class AuthState {
  final bool isLoading;
  final AuthError? error;
  final AuthUser? user;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.user,
  });

  AuthState copyWith({
    bool? isLoading,
    AuthError? error,
    AuthUser? user,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      user: user ?? this.user,
    );
  }
}
