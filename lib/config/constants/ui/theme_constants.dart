import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Const colors
const background_color = Color(0xFFFFFFFF);
const default_button_border = Color(0xFF000000);
const default_button_border_disabled = Color(0xFF000000);

class SociableColors {
  Color get backgroundColor => background_color;
  Color get buttonBorder => default_button_border;
  Color get buttonBorderDisabled => default_button_border_disabled;
}

abstract class SociableTheme {

  static final default_border_radius = BorderRadius.circular(2.0);

  final SociableColors colorSet;

  SociableTheme({@required this.colorSet});

  ThemeData get themeData => ThemeData(
    canvasColor: colorSet.backgroundColor,
    textButtonTheme: TextButtonThemeData(style: buttonStyle),
  );

  ButtonThemeData get buttonThemeData => ButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: SociableTheme.default_border_radius,
      side: BorderSide(color: colorSet.buttonBorder),
    )
  );

  ButtonStyle get buttonStyle => ButtonStyle(
    side: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return BorderSide(color: colorSet.buttonBorderDisabled);
      }
      return BorderSide(color: colorSet.buttonBorder);
    })
  );


  String get name;
}

class DefaultTheme extends SociableTheme {

  DefaultTheme() : super(colorSet: SociableColors());

  @override
  String get name => 'Default';
}

class SociableThemeController extends GetxController {
  final Rx<SociableTheme> _theme = _defaultTheme.obs;
  SociableTheme get theme => _theme.value;

  static final SociableTheme _defaultTheme = DefaultTheme();

  SociableColors get colorSet => theme.colorSet;

  ThemeData get themeData => theme.themeData;

  ButtonStyle get buttonStyle => theme.buttonStyle;

  SociableTheme get defaultTheme => _defaultTheme;
}