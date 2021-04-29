import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Const colors
const background_color = Color(0xFFFFFFFF);
const default_button_border = Color(0xFF000000);
const default_button_border_disabled = Color(0xFF000000);
const sociable_blue = Color(0xFF24c5ff);

const hint_text_color = Color(0xFF777777);

class SociableColors {
  Color get backgroundColor => background_color;
  Color get buttonBorder => default_button_border;
  Color get buttonBorderDisabled => default_button_border_disabled;
  Color get hintText => hint_text_color;
  Color get sociableBlue => sociable_blue;
}

abstract class SociableTheme {

  static final default_border_radius = BorderRadius.circular(2.0);
  static final chat_button_border_radius = BorderRadius.circular(30.0);

  final text_theme = TextTheme(
    headline1: TextStyle(color: sociable_blue, fontSize: 96),
    headline2: TextStyle(color: sociable_blue, fontSize: 60),
    headline3: TextStyle(color: sociable_blue, fontSize: 48),
    headline4: TextStyle(color: sociable_blue, fontSize: 34),
    headline5: TextStyle(color: sociable_blue, fontSize: 24),
    headline6: TextStyle(color: sociable_blue, fontSize: 20),
    subtitle1: TextStyle(color: sociable_blue, fontSize: 16),
    subtitle2: TextStyle(color: sociable_blue, fontSize: 14),
    bodyText1: TextStyle(color: sociable_blue, fontSize: 16),
    bodyText2: TextStyle(color: sociable_blue, fontSize: 14),
    button: TextStyle(color: sociable_blue, fontSize: 14),
    caption: TextStyle(color: sociable_blue, fontSize: 12),
    overline: TextStyle(color: sociable_blue, fontSize: 10),
  );

  final SociableColors colorSet;

  SociableTheme({@required this.colorSet});

  ThemeData get themeData => ThemeData(
    canvasColor: colorSet.backgroundColor,
    textButtonTheme: TextButtonThemeData(style: buttonStyle),
    textTheme: text_theme,
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
  
  ButtonStyle get chatButtonStyle => ButtonStyle(

    textStyle: MaterialStateProperty.resolveWith((_) =>
      TextStyle(color: Colors.white, fontSize: 14)
    ),
    backgroundColor: MaterialStateProperty.resolveWith((_) => colorSet.sociableBlue),
    side: MaterialStateProperty.resolveWith((_) => BorderSide.none),
    shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) =>
        RoundedRectangleBorder(
            borderRadius: SociableTheme.chat_button_border_radius
        )
    ),
    alignment: Alignment.center,
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
  ButtonStyle get chatButtonStyle => theme.chatButtonStyle;

  SociableTheme get defaultTheme => _defaultTheme;
}