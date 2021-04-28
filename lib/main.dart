import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sociable/config/constants/ui/theme_constants.dart';

import 'sociable_app.dart';

void main() {
  Get.put(SociableThemeController());
  runApp(SociableApp());
}
