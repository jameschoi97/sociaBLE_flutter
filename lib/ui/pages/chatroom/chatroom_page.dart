import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sociable/ble/peripheral_controller.dart';
import 'package:sociable/config/constants/ui/theme_constants.dart';

import 'action/chat_input_controller.dart';
import 'action/chat_scroll_controller.dart';

class ChatroomPage extends StatelessWidget {
  static final String name = '/chat_room';

  final _themeController = Get.find<SociableThemeController>();
  final _chatInputController = Get.find<ChatInputController>();
  final _chatScrollController = Get.find<ChatScrollController>();
  final _peripheralController = Get.find<PeripheralController>();

  List<ChatMessage> messages = [
    ChatMessage(messageContent: 'Hey there', messageType: 'receiver'),
    ChatMessage(messageContent: 'Hey you', messageType: 'sender'),
    ChatMessage(
        messageContent:
            'What would happen if I make a really long string??? I really wonder what\'s gonna happen',
        messageType: 'sender'),
    ChatMessage(
        messageContent:
            'What would happen if I make a really long string??? I really wonder what\'s gonna happen',
        messageType: 'receiver'),
  ].obs;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width.obs;
    _peripheralController.initialize('id');
    return Container(
      color: _themeController.theme.colorSet.backgroundColor,
      child: SafeArea(
        child: Scaffold(
            body: Column(children: [
              Row(children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: _themeController.theme.colorSet.sociableBlue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                    ),
                Expanded(
                    child: Text('CHATROOM')
                ),
              ]),
              Expanded(
                  child: Obx(() => ListView.builder(
                        controller: _chatScrollController,
                        shrinkWrap: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: messages[index].messageType == 'receiver'
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            child: Obx(() => Container(
                                  constraints: BoxConstraints(
                                    maxWidth: _screenWidth.value * 0.8,
                                  ),
                                  margin: EdgeInsets.only(
                                      left: 10, right: 10, bottom: 8),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 8),
                                  decoration: BoxDecoration(
                                    border: messages[index].messageType ==
                                            'receiver'
                                        ? Border()
                                        : Border.all(
                                            color: _themeController
                                                .theme.colorSet.sociableBlue),
                                    borderRadius: BorderRadius.circular(20),
                                    color: messages[index].messageType ==
                                            'receiver'
                                        ? _themeController
                                            .theme.colorSet.sociableBlue
                                        : Colors.white,
                                  ),
                                  child: Text(messages[index].messageContent,
                                      style: TextStyle(
                                        color: messages[index].messageType ==
                                                'receiver'
                                            ? Colors.white
                                            : _themeController
                                                .theme.colorSet.sociableBlue,
                                        fontSize: 18,
                                      )),
                                )),
                          );
                        },
                      ))),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                  color: _themeController.theme.colorSet.sociableBlue,
                ))),
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: _themeController
                                    .theme.colorSet.sociableBlue,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Icon(Icons.add, color: Colors.white),
                            ))),
                    Expanded(
                        child: TextField(
                      controller: _chatInputController,
                      decoration: InputDecoration(
                        hintText: 'Write message...',
                        hintStyle: TextStyle(
                            color: _themeController.theme.colorSet.hintText),
                        border: InputBorder.none,
                      ),
                    )),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: TextButton(
                        onPressed: () => _pressSend(context),
                        child: Text(
                          'SEND',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: _themeController.chatButtonStyle,
                      ),
                    )
                  ],
                ),
              )
            ])),
      ),
    );
  }

  void _pressSend(BuildContext context) {
    final newMessage = ChatMessage(
        messageContent: _chatInputController.text, messageType: 'receiver');
    messages.add(newMessage);
    _chatInputController.text = '';

    final TextPainter _textPainter = TextPainter(
      text: TextSpan(
        text: newMessage.messageContent,
        style: TextStyle(fontSize: 18),
      ),
      textDirection: TextDirection.ltr,
    )..layout(
        minWidth: 0, maxWidth: MediaQuery.of(context).size.width * 0.8 - 40);

    final _newMessageHeight = _textPainter.size.height;

    _chatScrollController.animateTo(
      _chatScrollController.position.maxScrollExtent + _newMessageHeight + 30,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;

  ChatMessage({
    @required this.messageContent,
    @required this.messageType,
  });
}
