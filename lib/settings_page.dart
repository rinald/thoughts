import 'package:flutter/material.dart';
import 'app.dart' show AppConfig;

// The page where the user can set their app preferences.
// The username should be set here the first time the user opens the app.
// There is also an option to change the app theme.
// Saved preferences (if any) are loaded each time the app is opened.
class SettingsPage extends StatelessWidget {
  final AppConfig config;
  final Function callback; // the callback to update the app state
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