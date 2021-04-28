import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'ui/pages/main_menu/main_menu_page.dart';

class SociableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SociaBLE',
      defaultTransition: Transition.rightToLeft,
      initialRoute: MainMenuPage.name,
      routes: {
        MainMenuPage.name: (_) => MainMenuPage(),
      },
    );
    throw UnimplementedError();
  }

}