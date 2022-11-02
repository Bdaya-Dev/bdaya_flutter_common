extension StringCheckExt on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isValid => !isNullOrEmpty;
}
