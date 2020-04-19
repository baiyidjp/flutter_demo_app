// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S();
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S();
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  String get tabBarHome {
    return Intl.message(
      'Home',
      name: 'tabBarHome',
      desc: '',
      args: [],
    );
  }

  String get tabBarFavor {
    return Intl.message(
      'Favor',
      name: 'tabBarFavor',
      desc: '',
      args: [],
    );
  }

  String get tabBarProfile {
    return Intl.message(
      'Me',
      name: 'tabBarProfile',
      desc: '',
      args: [],
    );
  }

  String get homeTitle {
    return Intl.message(
      'Food Court',
      name: 'homeTitle',
      desc: '',
      args: [],
    );
  }

  String get favorTitle {
    return Intl.message(
      'My Favor',
      name: 'favorTitle',
      desc: '',
      args: [],
    );
  }

  String get profileTitle {
    return Intl.message(
      'My Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'), Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}