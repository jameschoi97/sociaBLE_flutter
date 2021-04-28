import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sociable/config/constants/ui/theme_constants.dart';

class ChatroomPage extends StatelessWidget {
  static final String name = '/chat_room';

  final _themeController = Get.find<SociableThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _themeController.theme.colorSet.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('CHAT'),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.blue),
            textTheme: TextTheme(headline6: TextStyle(color: Colors.blue)),
          ),
            body: Center(
              child: Text("HI"),
            )
        ),
      ),
    );
    throw UnimplementedError();
  }

}