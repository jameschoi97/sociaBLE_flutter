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
            body: Column(children: [
              Expanded(
                child: Text("HI"),
              ),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: FloatingActionButton(
                      onPressed: (){},
                      child: Icon(Icons.add, color: Colors.white),
                      backgroundColor: Colors.blue,
                      elevation: 0,
                    ),
                  ),
                  Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Write message...',
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none,
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                        onPressed: (){},
                      child: Icon(Icons.send,color: Colors.blue, size: 20,),
                      style: _themeController.buttonStyle,
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
