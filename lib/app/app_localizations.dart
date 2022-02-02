import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// coverage:ignore-file

/// An app localizations to manage i18n strings
class AppLocalizations {
  /// A list of supported locals, ensure json file exists in i18n folder
  /// and asset is added to pubspec.yaml
  static const List<Locale> supportedLocals = [
    Locale('de', "CH"), // first is used as default
  ];

  /// A list of supported delegates
  static const List<LocalizationsDelegate> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// an app localization delegate
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppI18nDelegate();

  /// A default text if any translations are missing
  @visibleForTesting
  static const String defaultText = "<??>";

  /// A getter for unit test. Should only be used in unit test!
  @visibleForTesting
  Map<String, String> get localizedStrings => _localizedStrings;

  /// Default constructor
  AppLocalizations(this._locale);

  /// Helper method to keep the code in main clean.
  static Locale? resolutionCallback(
      Locale? locale, Iterable<Locale> supportedLocales) {
    // check if the current device locale is supported
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale!.languageCode &&
          supportedLocale.countryCode == locale.countryCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  }

  /// Loads the json into internal memory
  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/i18n/${_locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((String key, dynamic value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  /// Gets the string from json by given [key]. If key not exists
  /// a [defaultText] is returned.
  String translateKey(String key) {
    return _localizedStrings[key] ?? defaultText;
  }

  // private members
  final Locale _locale;
  late Map<String, String> _localizedStrings;
}

// coverage:ignore-start Justification: internal flutter class

/// Helper extension to translate i18n based strings.
extension I18nString on String {
  /// Gets the string from json by given content. If key not exists
  /// a [AppLocalizations.defaultText] is returned.
  String i18n(final BuildContext context) {
    AppLocalizations? localizations =
        Localizations.of<AppLocalizations>(context, AppLocalizations);

    if (localizations == null) {
      return AppLocalizations.defaultText;
    }

    return localizations.translateKey(this);
  }
}

/// A factory for a set of localized resources
class _AppI18nDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppI18nDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocals
        .any((element) => element.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
