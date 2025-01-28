enum SocketMessageType {
  connectionSuccessCode('0'),
  startConnectionCode("40"),
  priceChangeEventCode("42");

  final String value;
  const SocketMessageType(this.value);
}
