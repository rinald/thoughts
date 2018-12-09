import 'package:flutter/material.dart';

// This page allows the user to change the app's settings
// In this case it allows the user to change their username
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