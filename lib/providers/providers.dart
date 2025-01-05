import 'package:asset_tracker/core/models/auth_state_model.dart';
import 'package:asset_tracker/core/services/auth_service.dart';
import 'package:asset_tracker/core/state/auth_notifier.dart';
import 'package:asset_tracker/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return FirebaseAuthService(FirebaseAuth.instance);
});

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  return AuthNotifier(authService);
});
