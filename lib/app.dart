import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'post_page.dart';
import 'about_page.dart';

// This class is used to manage app configurations
class AppConfig {
  final String title;
  ThemeData theme;
  String username;

  AppConfig({@required this.title, this.theme, this.username});
}

// This is the actual app
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // The configuration for this app
  var _config = AppConfig(
    title: 'Thoughts',
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
  );

  // Read the saved username, if any
  void _init() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _config.username = prefs.getString('username') ?? '';    
    });
  }

  // Update the state of the app
  void _update(String username) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    setState(() {
      _config.username = username;
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _config.title,
      theme: _config.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(_config),
        '/settings': (context) => SettingsPage(_config, callback: _update),
        '/about': (context) => AboutPage(),
        '/post': (context) => PostPage(_config)
      },
    );
  }
}