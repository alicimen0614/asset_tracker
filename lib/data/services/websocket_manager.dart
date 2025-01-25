import 'dart:async';
import 'dart:convert';
import 'package:asset_tracker/data/models/socket_models/haremaltin_model.dart';
import 'package:asset_tracker/core/services/websocket_service.dart';
import 'package:asset_tracker/core/utils/enums/socket_message_type.dart';
import 'package:web_socket/web_socket.dart';

import '../models/socket_models/asset_model.dart';

class WebSocketManager implements IWebSocketService {
  final String url;
  WebSocket? _webSocket;
  final StreamController<Map<String, dynamic>> _controller =
      StreamController<Map<String, dynamic>>.broadcast();
  final List<CurrencyModel> _fixedDataList = [];
  final int maxRetries = 3;
  final int delayBetweenRetries = 2;

  WebSocketManager(this.url);

  @override
  Future<void> connect({int retryCount = 0}) async {
    try {
      _webSocket = await WebSocket.connect(Uri.parse(url));
      _listenToWebSocketEvents();
    } catch (e) {
      if (retryCount < maxRetries) {
        await Future.delayed(Duration(seconds: delayBetweenRetries));
        await connect(retryCount: retryCount + 1);
      } else {
        _controller.addError(e);
      }
    }
  }

  void _listenToWebSocketEvents() {
    _webSocket?.events.listen(
      (event) async {
        switch (event) {
          case TextDataReceived():
            if (event.text
                .startsWith(SocketMessageType.connectionSuccessCode.value)) {
              sendMessage(SocketMessageType.startConnectionCode.value);
            } else if (event.text
                .startsWith(SocketMessageType.priceChangeEventCode.value)) {
              _handleData(event);
            }
            break;
          case BinaryDataReceived():
          case CloseReceived():
            break;
        }
      },
      onError: (error) => _controller.addError(error),
      onDone: () async {
        await connect();
      },
    );
  }

  void _handleData(TextDataReceived event) {
    final decoded = json.decode(event.text.substring(2));
    // get the actual data from the second index of the decoded list
    final incomingData = HaremAltinData.fromJson(decoded[1]);
    final dataList = incomingData.data;

    _updateFixedDataList(dataList);
    _controller
        .add({'date': incomingData.meta?.tarih, 'itemList': _fixedDataList});
  }

  void _updateFixedDataList(List<CurrencyModel> incomingData) {
    for (var data in incomingData) {
      int index =
          _fixedDataList.indexWhere((element) => element.code == data.code);
      if (index != -1) {
        _fixedDataList[index] = data;
      } else {
        _fixedDataList.add(data);
      }
    }
  }

  @override
  Future<void> sendMessage(String message) async {
    _webSocket?.sendText(message);
  }

  @override
  Stream<Map<String, dynamic>> get stream => _controller.stream;
}
