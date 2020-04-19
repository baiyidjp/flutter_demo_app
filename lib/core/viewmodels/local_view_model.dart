import 'package:flutter/material.dart';

class JPLocalViewModel extends ChangeNotifier {

  Locale _locale = Locale.fromSubtags(languageCode: 'zh');

  Locale get locale => _locale;

  set locale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}