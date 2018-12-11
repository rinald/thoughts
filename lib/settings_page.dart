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
        child: Column(
          children: <Widget>[
            ListTile(
              title: TextFormField(
                initialValue: config.username,
                onFieldSubmitted: (username) {
                  config.username = username;
                  callback(config);
                },
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            SwitchListTile(
              title: Text('Dark theme'),
              subtitle: Text('Enable dark theme throughout the app'),
              value: config.darkThemeEnabled,
              onChanged: (value) {
                config.darkThemeEnabled = value;
                callback(config);
              }
            ),
          ],
        ),
      ),
    );
  }
}