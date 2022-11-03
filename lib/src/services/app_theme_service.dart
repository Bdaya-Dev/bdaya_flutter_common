import 'package:bdaya_shared_value/bdaya_shared_value.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class AppThemeServiceBase {
  final locale = SharedValue<Locale>(
    value: const Locale('ar'),
    autosave: true,
    key: 'locale',
    customEncode: (v) {
      return v.languageCode;
    },
    customDecode: (v) {
      return Locale(v);
    },
  );
  final themeMode = SharedValue<ThemeMode>(
    value: ThemeMode.light,
    autosave: true,
    key: 'theme',
    customEncode: (v) {
      return v.name;
    },
    customDecode: (v) {
      return ThemeMode.values.byName(v);
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
    await themeMode.load();
    await locale.load();
  }

  @override
  Future<void> setLocale(Locale newLocale) async {
    locale.$ = newLocale;
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    themeMode.$ = mode;
  }
}
