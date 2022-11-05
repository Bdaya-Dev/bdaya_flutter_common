import 'package:bdaya_flutter_common/bdaya_flutter_common.dart';
import 'package:flutter/material.dart';

abstract class AppThemeServiceBase with BdayaLoggableMixin {
  final locale = SharedValue<Locale?>(
    value: null,
    key: 'locale',
    customEncode: (v) {
      return v?.toLanguageTag();
    },
    customDecode: (v) {
      if (v.isNullOrEmpty) return null;
      final split = v!.split('-');
      final langCode = split[0];
      final country = split.length > 1 ? split.last : null;
      final script = split.length > 2 ? split[1] : null;
      //en => langCode
      //en-US => langCode-countryCode
      //zn-Hans-CN => langCode-scriptCode-countryCode
      return Locale.fromSubtags(
        languageCode: langCode,
        scriptCode: script,
        countryCode: country,
      );
    },
  );
  final themeMode = SharedValue<ThemeMode?>(
    value: null,
    key: 'theme',
    customEncode: (v) {
      return v?.name;
    },
    customDecode: (v) {
      if (v.isNullOrEmpty) return null;
      return ThemeMode.values.byName(v!);
    },
  );

  Future<void> init();

  Future<void> setThemeMode(ThemeMode mode);
  Future<void> setLocale(Locale newLocale);
}

/// Saves theme and locale locally via SharedPreference
@LazySingleton(as: AppThemeServiceBase)
class LocalAppThemeService extends AppThemeServiceBase {
  @override
  Future<void> init() async {
    logger.fine('Initializing ...');
    await themeMode.load();
    await locale.load();
    logger.fine(
        'Initialization Done, themeMode: ${themeMode.$?.name}, locale: ${locale.$?.toLanguageTag()}.');
  }

  @override
  Future<void> setLocale(Locale newLocale) async {
    logger.fine('Setting Locale to ${newLocale.toLanguageTag()}...');
    locale.$ = newLocale;
    await locale.save();
    logger.fine('Setting Locale Done.');
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    logger.fine('Setting Theme Mode to ${mode.name}...');
    themeMode.$ = mode;
    await themeMode.save();
    logger.fine('Setting Theme Mode Done.');
  }
}
