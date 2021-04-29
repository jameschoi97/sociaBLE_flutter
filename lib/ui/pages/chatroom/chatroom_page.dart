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
              iconTheme: IconThemeData(color: _themeController.theme.colorSet.sociableBlue),
              textTheme: TextTheme(headline6: TextStyle(color: _themeController.theme.colorSet.sociableBlue)),
            ),
            body: Column(children: [
              Expanded(
                child: Text("HI"),
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: _themeController.theme.colorSet.sociableBlue,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(Icons.add, color: Colors.white),
                      )
                    )
                  ),
                  Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write message...',
                          hintStyle: TextStyle(color: _themeController.theme.colorSet.hintText),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                        onPressed: (){},
                      child: Text('SEND', style: TextStyle(color: Colors.white),),
                      style: _themeController.chatButtonStyle,
                    ),
                  )
                ],
              )
            ])),
      ),
    );
    throw UnimplementedError();
  }
}
