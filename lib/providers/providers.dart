import 'package:asset_tracker/core/models/auth_state_model.dart';
import 'package:asset_tracker/core/models/websocket_state_model.dart';
import 'package:asset_tracker/core/state/auth_notifier.dart';
import 'package:asset_tracker/data/services/firebase_auth_service.dart';
import 'package:asset_tracker/presentation/views/home/home_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/services/websocket_manager.dart';

final _firebaseAuthService = FirebaseAuthService(FirebaseAuth.instance);
final webSocketServiceInstance =
    WebSocketManager(dotenv.env['SOCKET_CONNECTION_URL']!);

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(_firebaseAuthService);
});

final homePageViewModelProvider =
    StateNotifierProvider<HomePageViewModel, WebSocketState>((ref) {
  return HomePageViewModel(webSocketServiceInstance);
});
