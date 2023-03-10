import 'package:flutter/widgets.dart';
import 'package:language_code/src/language_codes.dart';

import 'language_code_stub.dart'
    if (dart.library.html) 'language_code_web.dart';

/// This package help you get the current language code and locale of
/// the device
class LanguageCode {
  LanguageCode._();

  /// Get current language code of the device. This [rawCode] can contain the
  /// '-' or '_' character, you can use [locale] or [code] insteads.
  static String get rawCode => languaeCodeImpl;

  /// Get current language locale of the device
  static Locale get locale {
    final String token = rawCode.contains('-') ? '-' : '_';
    List localeList = rawCode.split(token);

    if (localeList.length < 2) {
      return Locale(localeList[0]);
    }

    return Locale(localeList[0], localeList[1]);
  }

  /// Get the language code as [LanguageCodes].
  static LanguageCodes get code => LanguageCodes.fromLocale(locale);
}
