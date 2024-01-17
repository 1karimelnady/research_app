import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  List<String> languageList = ['English', 'Arabic'];
  bool isEnglish = false;
  Map<String, String> arabicTexts = {};
  Map<String, String> englishTexts = {};

  // void changeLanguage({bool? EnglishLanguage}) async {
  //   final SharedPreferences sharedPreference =
  //       await SharedPreferences.getInstance();
  //
  //   isEnglish = EnglishLanguage!;
  //   sharedPreference.setBool('savedLanguage', isEnglish);
  //   notifyListeners();
  // }

// ignore: missing_return
  String getTexts(String text) {
    if (isEnglish == true) return englishTexts[text]!;
    return arabicTexts[text]!;
  }

  // Future<bool> getLanguage() async {
  //   final SharedPreferences sharedPreference =
  //       await SharedPreferences.getInstance();
  //
  //   isEnglish = sharedPreference.getBool('savedLanguage') ?? false;
  //
  //   notifyListeners();
  //   return isEnglish;
  // }
}
