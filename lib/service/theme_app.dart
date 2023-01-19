import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemePage with ChangeNotifier {
  bool dartTheme = false;
  ThemeData? currentTheme;

  bool get getDarkTheme => dartTheme;
  ThemeData get getCurrentTheme => currentTheme!;

  ThemePage(int theme) {
    switch (theme) {
      case 1: 
      dartTheme = false;
      currentTheme =
          ThemeData.light().copyWith(textTheme: GoogleFonts.vidalokaTextTheme());
        break;
      default:
    }
  }

  set getDarkTheme(bool value) {
    dartTheme = value;
    if (value) {
      currentTheme =
          ThemeData.dark().copyWith(textTheme: GoogleFonts.vidalokaTextTheme());
    } else {
      currentTheme = ThemeData.light().copyWith(
        textTheme: GoogleFonts.vidalokaTextTheme(),
      );
    }
    notifyListeners();
  }
}
