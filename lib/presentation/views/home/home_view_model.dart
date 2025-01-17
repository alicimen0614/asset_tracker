import 'package:asset_tracker/core/models/haremaltin_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/models/websocket_state_model.dart';
import '../../../core/services/websocket_service.dart';

class HomePageViewModel extends StateNotifier<WebSocketState> {
  final IWebSocketService _webSocketService;

  HomePageViewModel(this._webSocketService)
      : super(WebSocketState(
            isLoading: true, itemList: List<Item>.empty(), date: ""));

  Future<void> connectAndFetch() async {
    try {
      await _webSocketService.connect();
      _webSocketService.stream.listen((event) {
        state = state.copyWith(
          isLoading: false,
          itemList: event['itemList'],
          date: event['date'],
        );
      }, onError: (error) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        );
      });
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: e.toString(),
      );
    }
  }
}
