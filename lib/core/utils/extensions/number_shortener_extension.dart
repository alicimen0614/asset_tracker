extension DetermineColorExtension on String {
  String toShortVersion() {
    return double.tryParse(this)?.toStringAsFixed(2) ?? this;
  }
}
