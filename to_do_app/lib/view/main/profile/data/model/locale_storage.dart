import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LocaleStorageService {
  final GetStorage _storage = GetStorage();
  final String _localeKey = 'locale';

  Locale get locale {
    String? localeString = _storage.read<String>(_localeKey);
    if (localeString != null) {
      List<String> localeList = localeString.split('_');
      return Locale(localeList[0], localeList.length > 1 ? localeList[1] : '');
    }
    return const Locale('en', 'US'); 
  }

  void saveLocale(Locale locale) {
    _storage.write(_localeKey, locale.toString());
  }
}
