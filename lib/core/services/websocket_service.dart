abstract class IWebSocketService {
  Future<void> connect();
  Future<void> sendMessage(String message);
  Stream<Map<String, dynamic>> get stream;
}
