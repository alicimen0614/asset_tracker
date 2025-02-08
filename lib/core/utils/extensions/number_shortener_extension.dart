extension DetermineColorExtension on String {
  String toShortVersion() {
    String result;
    result = double.tryParse(this)?.toStringAsFixed(2) ?? this;
    result = "₺ $result";
    return result;
  }
}
