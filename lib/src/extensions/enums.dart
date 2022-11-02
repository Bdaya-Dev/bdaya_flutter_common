extension EnumExt on Map<String, dynamic> {
  T? extractNullableEnumByName<T extends Enum>(String key, List<T> values) {
    final value = this[key];
    if (value is! String) return null;
    return values.byName(value);
  }
}
