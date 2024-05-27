import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme {
  final _lightColors = _LightColors();

  late ThemeData theme; // debug modda isen late final kullanmamalısın degisiklikleri görmek için final kaldır

  LightTheme() {
    theme = ThemeData(
        scaffoldBackgroundColor: _lightColors._white.withOpacity(0.9),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.deepPurple, foregroundColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: _lightColors._ultravioletOnsible,
          titleTextStyle: TextStyle(color: _lightColors._white, fontSize: 24),
          centerTitle: true,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(40))),
        ),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(
          onPrimary: _lightColors._ultravioletOnsible,
          onSecondary: _lightColors._amethystLightViolet,
        )),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(_lightColors._extraLife),
        ),
        colorScheme: ColorScheme.light(),
        textTheme: ThemeData.light().textTheme.copyWith(bodyLarge: TextStyle(fontSize: 24, color: _lightColors._plum)));
  }
}

class _LightColors {
  final Color _white = Color.fromARGB(255, 250, 250, 250);
  final Color _plum = Color.fromARGB(255, 103, 55, 103);
  final Color _ultravioletOnsible = Color.fromARGB(255, 182, 67, 214);
  final Color _amethystLightViolet = Color.fromARGB(255, 206, 196, 207);
  final Color _fertilityGreen = Color.fromARGB(255, 102, 255, 0);
  final Color _extraLife = Color.fromARGB(255, 102, 186, 18);
}
