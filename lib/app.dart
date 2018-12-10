import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'post_page.dart';
import 'about_page.dart';

class AppConfig {
  final String title;
  ThemeData theme;
  String username;

  AppConfig({@required this.title, this.theme, this.username});
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppConfig _config = AppConfig(
    title: 'Thoughts',
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
  );

  void _init() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _config.username = prefs.getString('username') ?? '';    
    });
  }

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