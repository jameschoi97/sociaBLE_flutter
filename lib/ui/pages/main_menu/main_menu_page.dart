import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainMenuPage extends StatelessWidget {
  static final String name = '/main_menu';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sociaBLE'),
      ),
      body: Column (
        children: [
          SizedBox(height: 20),
          Container(
            width: 200,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your ID',
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    Text('Device 1'),
                    Text('Device 2'),
                  ],
                ),
              ),
          ),
          TextButton(
              onPressed: () => {print('HI')},
              child: Text('Create a Room'),
          )
        ],
      )
    );
    throw UnimplementedError();
  }

}