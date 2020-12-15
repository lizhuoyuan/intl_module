import 'package:flutter/material.dart';
import 'package:intl/src/intl_helpers.dart';
import 'package:intl/intl.dart' as RealIntl;
import 'package:intl_module/generated/intl/messages_all.dart';
import 'package:intl_module/generated/l10n.dart';

class Intl {
  // copied from the real intl package
  static String message(String message_str,
          {String desc: '',
          Map<String, Object> examples: const {},
          String locale,
          String name,
          List<Object> args,
          String meaning,
          bool skip}) =>
      _message(message_str, locale, name, args, meaning);

  // copied from the real intl package
  static String _message(
      String message_str, String locale, String name, List<Object> args, String meaning) {
    return myMessageLookup.lookupMessage(message_str, locale, name, args, meaning);
  }

  static MessageLookup myMessageLookup =
      UninitializedLocaleData('initializeMessages(<locale>)', null);

  static Future<S> load(Locale locale) {
    final name = locale.countryCode?.isEmpty ?? true ? locale.languageCode : locale.toString();
    final localeName = RealIntl.Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      final original = messageLookup;
      messageLookup = myMessageLookup;
      return initializeMessages(localeName).then((_) {
        myMessageLookup = messageLookup;
        messageLookup = original;
        RealIntl.Intl.defaultLocale = localeName;
        return S();
      });
    });
  }
}
