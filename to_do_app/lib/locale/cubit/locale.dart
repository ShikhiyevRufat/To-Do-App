import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do_app/view/main/profile/data/model/locale_storage.dart';


class LocaleNotifier extends StateNotifier<Locale> {
  final LocaleStorageService _localeStorageService;

  LocaleNotifier(this._localeStorageService) 
      : super(_localeStorageService.locale);

  void changeLocale(Locale locale) {
    if (locale == state) {
      return;
    }
    _localeStorageService.saveLocale(locale);
    state = locale;
  }

  Locale get currentLocale => state;
}

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale>((ref) {
  return LocaleNotifier(LocaleStorageService());
});
