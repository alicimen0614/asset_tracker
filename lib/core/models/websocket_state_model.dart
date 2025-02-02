import '../../data/models/socket_models/asset_model.dart';

class WebSocketState {
  final bool isLoading;
  final String? errorMessage;
  final List<CurrencyModel>? itemList;
  final String date;
  final List<CurrencyModel>? fixedItemList;

  WebSocketState(
      {required this.isLoading,
      this.errorMessage,
      required this.itemList,
      required this.date,
      this.fixedItemList});

  WebSocketState copyWith(
      {bool? isLoading,
      String? errorMessage,
      List<CurrencyModel>? itemList,
      String? date,
      List<CurrencyModel>? fixedItemList}) {
    return WebSocketState(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage,
        itemList: itemList ?? this.itemList,
        date: date ?? this.date,
        fixedItemList: fixedItemList ?? this.fixedItemList);
  }
}
