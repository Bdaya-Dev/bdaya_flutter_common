// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class BdayaLocalizationsExample {
  BdayaLocalizationsExample();

  static BdayaLocalizationsExample? _current;

  static BdayaLocalizationsExample get current {
    assert(_current != null,
        'No instance of BdayaLocalizationsExample was loaded. Try to initialize the BdayaLocalizationsExample delegate before accessing BdayaLocalizationsExample.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<BdayaLocalizationsExample> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = BdayaLocalizationsExample();
      BdayaLocalizationsExample._current = instance;

      return instance;
    });
  }

  static BdayaLocalizationsExample of(BuildContext context) {
    final instance = BdayaLocalizationsExample.maybeOf(context);
    assert(instance != null,
        'No instance of BdayaLocalizationsExample present in the widget tree. Did you add BdayaLocalizationsExample.delegate in localizationsDelegates?');
    return instance!;
  }

  static BdayaLocalizationsExample? maybeOf(BuildContext context) {
    return Localizations.of<BdayaLocalizationsExample>(
        context, BdayaLocalizationsExample);
  }

  /// `Bdaya Development Common Example`
  String get appName {
    return Intl.message(
      'Bdaya Development Common Example',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Test`
  String get test {
    return Intl.message(
      'Test',
      name: 'test',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<BdayaLocalizationsExample> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<BdayaLocalizationsExample> load(Locale locale) =>
      BdayaLocalizationsExample.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
