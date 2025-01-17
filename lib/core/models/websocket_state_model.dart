import 'package:asset_tracker/core/models/haremaltin_model.dart';

class WebSocketState {
  final bool isLoading;
  final String? errorMessage;
  final List<Item>? itemList;
  final String date;

  WebSocketState(
      {required this.isLoading,
      this.errorMessage,
      required this.itemList,
      required this.date});

  WebSocketState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<Item>? itemList,
    String? date,
  }) {
    return WebSocketState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        itemList: itemList ?? this.itemList,
        date: date ?? this.date);
  }
}
