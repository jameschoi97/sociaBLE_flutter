import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'ui/pages/main_menu/main_menu_page.dart';
import 'config/constants/ui/theme_constants.dart';

class SociableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeController = Get.find<SociableThemeController>();
    return GetMaterialApp(
      title: 'SociaBLE',
      theme: themeController.theme.themeData,
      defaultTransition: Transition.rightToLeft,
      initialRoute: MainMenuPage.name,
      routes: {
        MainMenuPage.name: (_) => MainMenuPage(),
      },
    );
    throw UnimplementedError();
  }

}