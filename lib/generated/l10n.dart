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

class BdayaLocalizations {
  BdayaLocalizations();

  static BdayaLocalizations? _current;

  static BdayaLocalizations get current {
    assert(_current != null,
        'No instance of BdayaLocalizations was loaded. Try to initialize the BdayaLocalizations delegate before accessing BdayaLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<BdayaLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = BdayaLocalizations();
      BdayaLocalizations._current = instance;

      return instance;
    });
  }

  static BdayaLocalizations of(BuildContext context) {
    final instance = BdayaLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of BdayaLocalizations present in the widget tree. Did you add BdayaLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static BdayaLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<BdayaLocalizations>(context, BdayaLocalizations);
  }

  /// `Required`
  String get required {
    return Intl.message(
      'Required',
      name: 'required',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<BdayaLocalizations> {
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
  Future<BdayaLocalizations> load(Locale locale) =>
      BdayaLocalizations.load(locale);
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
