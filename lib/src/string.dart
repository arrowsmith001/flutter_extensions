extension StringModifier on String? {
  bool isNullOrEmpty() => this == null || this == '';
}