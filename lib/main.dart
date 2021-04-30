import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sociable/config/constants/ui/theme_constants.dart';
import 'package:sociable/ui/pages/chatroom/action/chat_input_controller.dart';
import 'package:sociable/ui/pages/chatroom/action/chat_scroll_controller.dart';

import 'sociable_app.dart';

void main() {
  Get.put(SociableThemeController());
  Get.put(ChatInputController());
  Get.put(ChatScrollController());
  runApp(SociableApp());
}
