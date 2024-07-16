import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../l10n.dart';

class LocaleNotifier extends StateNotifier<Locale> {
  LocaleNotifier() : super(LocalizationConfigs().currentLocale);

  void changeLocale(Locale locale) {
    if (locale == state) {
      return;
    }
    LocalizationConfigs().changeLocale(locale);
    state = locale;
  }

  Locale get currentLocale => state;
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier();
});
