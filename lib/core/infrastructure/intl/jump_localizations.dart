import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testapp/core/infrastructure/intl/messages/messages_all.dart';

class JumpLocalizations {
  static Future<JumpLocalizations> load(Locale locale) async {
    final localeName = locale.countryCode == null || locale.countryCode.isEmpty
        ? locale.languageCode
        : locale.toString();

    final canonicalLocaleName = Intl.canonicalizedLocale(localeName);

    Intl.defaultLocale = canonicalLocaleName;

    await initializeMessages(canonicalLocaleName);

    return JumpLocalizations();
  }

  static JumpLocalizations of(BuildContext context) =>
      Localizations.of<JumpLocalizations>(context, JumpLocalizations);

  String get localeName => Intl.message(
        'en_US',
        name: 'localeName',
        desc: 'Current locale',
      );

  String get appTitle => Intl.message(
        'Test app',
        name: 'appTitle',
        desc: 'App title',
      );

  String versionAndBuild(String version, String buildNumber) => Intl.message(
        'Version: $version (build: $buildNumber)',
        name: 'versionAndBuild',
        args: [version, buildNumber],
        desc: 'Version and build',
      );

  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///       Errors
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  String get unknownError => Intl.message(
        'Unknown error',
        name: 'unknownError',
        desc: 'Unknown error without details',
      );

  String unknownErrorWithDebugDetails(String message) => Intl.message(
        'Unknown error: $message',
        name: 'unknownErrorWithDebugDetails',
        args: [message],
        desc: 'Unknown error with details',
      );

  String get unauthorizedError => Intl.message(
        'User is not authorized',
        name: 'unauthorizedError',
        desc: 'unauthorized error',
      );

  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  ///       UI
  /// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  String get login => Intl.message(
        'Log in',
        name: 'login',
        desc: 'log in',
      );

  String get createAnAccount => Intl.message(
        'Create an Account',
        name: 'createAnAccount',
        desc: 'create an account',
      );

  String get settingsPage => Intl.message(
        'Settings',
        name: 'settingsPage',
        desc: 'settingsPage',
      );

  String get ok => Intl.message(
        'OK',
        name: 'ok',
        desc: 'ok',
      );

  String get warning => Intl.message(
        'Warning',
        name: 'warning',
        desc: 'warning',
      );

  String get favoritesPage => Intl.message(
        'Favorites',
        name: 'favoritesPage',
        desc: 'favoritesPage',
      );

  String get password => Intl.message(
        'Password',
        name: 'password',
        desc: 'password',
      );

  String get repeatPassword => Intl.message(
        'Repeat password',
        name: 'repeatPassword',
        desc: 'repeat password',
      );

  String get signup => Intl.message(
        'Sign up',
        name: 'signup',
        desc: 'sign up',
      );

  String get email => Intl.message(
        'E-mail',
        name: 'email',
        desc: 'email',
      );

  String get close => Intl.message(
        'Close',
        name: 'close',
        desc: 'Close',
      );

  String get fieldCanNotBeEmpty => Intl.message(
        'Please fill in the field',
        name: 'fieldCanNotBeEmpty',
        desc: 'Please fill in the field',
      );

  String get passwordsNotEqual => Intl.message(
        'Password and password confirmation are not the same',
        name: 'passwordsNotEqual',
        desc: 'passwords not equal',
      );

  String get name => Intl.message(
        'Name',
        name: 'name',
        desc: 'name',
      );

  String get firstName => Intl.message(
        'First Name',
        name: 'firstName',
        desc: 'first name',
      );

  String get id => Intl.message(
        'ID',
        name: 'id',
        desc: 'id',
      );

  String get books => Intl.message(
        'All books',
        name: 'books',
        desc: 'books',
      );

  String get authorsPage => Intl.message(
        'Authors',
        name: 'authorsPage',
        desc: 'authorsPage',
      );

  String get logOut => Intl.message(
        'Log Out',
        name: 'logOut',
        desc: 'log out',
      );
}
