import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/core/infrastructure/intl/jump_localizations.dart';

class JumpLocalizationsDelegate
    extends LocalizationsDelegate<JumpLocalizations> {
  const JumpLocalizationsDelegate();

  static const delegate = JumpLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ru', 'en'].contains(locale.languageCode);

  @override
  Future<JumpLocalizations> load(Locale locale) =>
      JumpLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<JumpLocalizations> old) => false;
}
