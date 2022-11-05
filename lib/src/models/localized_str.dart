import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';

class BdayaLocalizedStr {
  static const kAr = 'ar';
  static const kEn = 'en';

  /// The default locales for the app, can be changed during runtime
  // static List<String> locales = [
  //   kEn,
  //   kAr,
  // ];

  /// The default rtl locales
  static Set<String> rtlLocales = {kAr};

  final Map<String, String?> backingField;

  String? get ar => backingField[kAr];
  String? get en => backingField[kEn];

  String? operator [](String locale) {
    return backingField[locale];
  }

  operator []=(String locale, String? value) {
    backingField[locale] = value;
  }

  BdayaLocalizedStr.fromBackingField(
    Map<String, String?> backingField, {
    bool copy = false,
  }) : backingField = copy ? Map.of(backingField) : backingField;

  BdayaLocalizedStr({
    String? ar,
    String? en,
  }) : backingField = {
          kAr: ar,
          kEn: en,
        };

  Map<String, dynamic> toMap() {
    return backingField;
  }

  factory BdayaLocalizedStr.fromMap(
    Map<String, dynamic> map, {
    bool copy = true,
  }) {
    return BdayaLocalizedStr.fromBackingField(
      map.cast<String, String?>(),
      copy: copy,
    );
  }

  @override
  String toString() => backingField.toString();
}

extension LocalizedStrExt on BdayaLocalizedStr {
  String? get firstNotNullValue =>
      backingField.values.firstWhereOrNull((element) => element != null);

  String of(BuildContext context) {
    return ofLocale(Localizations.localeOf(context));
  }

  String? maybeOf(BuildContext context) {
    return maybeOfLocale(Localizations.localeOf(context));
  }

  String ofLocale(Locale locale) {
    return maybeOfLocale(locale) ?? firstNotNullValue ?? '';
  }

  String? maybeOfLocale(Locale locale) {
    return backingField[locale.toLanguageTag()] ??
        backingField[locale.languageCode];
  }
}
