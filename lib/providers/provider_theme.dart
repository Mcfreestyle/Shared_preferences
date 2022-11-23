import 'package:flutter/material.dart';

class ProviderTheme extends ChangeNotifier {
  ThemeData currentTheme;

  ProviderTheme({required bool isDarkMode})
      : currentTheme = isDarkMode
            ? ThemeData(
                useMaterial3: true, colorScheme: const ColorScheme.dark())
            : ThemeData(
                useMaterial3: true, colorScheme: const ColorScheme.light());

  setLight() {
    currentTheme =
        ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light());
    notifyListeners();
  }

  setDark() {
    currentTheme =
        ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark());
    notifyListeners();
  }
}
