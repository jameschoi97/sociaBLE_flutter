import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sociable/config/constants/ui/theme_constants.dart';
import 'package:sociable/ui/pages/chatroom/chatroom_page.dart';

class MainMenuPage extends StatelessWidget {
  static final String name = '/main_menu';

  final _themeController = Get.find<SociableThemeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _themeController.theme.colorSet.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          body: Column (
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your ID',
                    ),
                  ),
                )
              ),
              Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                    ),
                    margin: const EdgeInsets.all(50.0),
                    child: ListView(
                      children: [
                        Text('Device 1'),
                        Text('Device 2'),
                      ],
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    height: 70,
                    child: TextButton(
                      onPressed: () => Get.to(()=> ChatroomPage(), arguments: ['hi']),
                      child: Text('Create a Room'),
                    ),
                  ),
                ),
              )
            ],
          )
        ),
      ),
    );
    throw UnimplementedError();
  }

}