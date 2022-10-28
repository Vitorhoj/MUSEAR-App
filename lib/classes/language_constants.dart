import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String LANGUAGE_CODE = 'languageCode';

//languages code
const String PORTUGUESE = 'pt';
const String SPANISH = 'es';
const String ENGLISH = 'en';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? PORTUGUESE;
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case PORTUGUESE:
      return const Locale(PORTUGUESE, '');
    case SPANISH:
      return const Locale(SPANISH, "");
    case ENGLISH:
      return Locale(ENGLISH, "");
    default:
      return Locale(PORTUGUESE, 'BR');
  }
}

AppLocalizations translation(BuildContext context) {
  return AppLocalizations.of(context)!;
}