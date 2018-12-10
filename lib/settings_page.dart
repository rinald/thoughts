import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final config;
  final Function callback;
  SettingsPage(this.config, {this.callback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              initialValue: config.username,
              onFieldSubmitted: (username) {
                callback(username);
                Navigator.of(context).pop();
              },
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            )
          ],
        ),
      ),
    );
  }
}