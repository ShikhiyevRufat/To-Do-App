import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:to_do_app/core/router/app_router.dart';
import 'package:to_do_app/locale/locale.dart';

LocalizationService get locale => LocalizationService.of(globalContext)!;

class LocalizationConfigs {
  static final delegates = [
    LocalizationService.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final supportedLocales = [
    const Locale('en', 'US'),
    const Locale('az', 'AZ'),
    const Locale('ru', 'RU'),
  ];

  Locale get currentLocale {
    final lang = Platform.localeName.split('_')[0];
    switch (lang) {
      case 'en':
        return const Locale('en', 'US');
      case 'az':
        return const Locale('az', 'AZ');
      case 'ru':
        return const Locale('ru', 'RU');
      default:
        return const Locale('az', 'AZ');
    }
  }

  void changeLocale(Locale locale) {
    // Implement the logic to change the locale
  }
}
