import 'package:asset_tracker/core/utils/mixins/currency_filter_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/socket_models/asset_model.dart';
import '../../../core/models/websocket_state_model.dart';
import '../../../core/services/websocket_service.dart';

class HomePageViewModel extends StateNotifier<WebSocketState>
    with CurrencyFilterMixin {
  final IWebSocketService _webSocketService;
  final TextEditingController searchBarController = TextEditingController();

  HomePageViewModel(this._webSocketService)
      : super(WebSocketState(
            isLoading: true, itemList: List<CurrencyModel>.empty(), date: ""));

  Future<void> connectAndFetch() async {
    const String eventMapDateKey = 'date';
    const String eventMapItemListKey = 'itemList';
    try {
      await _webSocketService.connect();
      _webSocketService.stream.listen((event) {
        if (searchBarController.text.isNotEmpty) {
          state = state.copyWith(
            isLoading: false,
            date: event[eventMapDateKey],
          );
          //to get the filtered assets we first provide the refreshed list of assets if it is not null we use fixed state's asset list
          getFilteredAssets(
              event[eventMapItemListKey] ?? state.fixedItemList ?? []);
          return;
        } else {
          state = state.copyWith(
            isLoading: false,
            itemList: event[eventMapItemListKey],
            date: event[eventMapDateKey],
            fixedItemList: event[eventMapItemListKey],
          );
        }
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

  Future<void> getFilteredAssets(List<CurrencyModel> assetsList) async {
    final searchText = searchBarController.text.toLowerCase();
    final filteredItemList = assetsList
        .where((element) => matchesSearchQuery(element, searchText))
        .toList();

    state = state.copyWith(
        isLoading: false,
        itemList: searchBarController.text.isNotEmpty
            ? filteredItemList.isEmpty
                ? state.itemList
                : filteredItemList
            : state.fixedItemList);
  }
}
