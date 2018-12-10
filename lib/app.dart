import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'post_page.dart';
import 'about_page.dart';
import 'themes.dart';

class AppConfig {
  final String title;
  bool darkThemeEnabled;
  String username;

  AppConfig({@required this.title, this.username, this.darkThemeEnabled});
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  AppConfig _config = AppConfig(
    title: 'Thoughts',
  );

  void _init() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      _config.username = prefs.getString('username') ?? '';
      _config.darkThemeEnabled = prefs.getBool('darkThemeEnabled') ?? false;
    });
  }

  void _update(AppConfig config) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('username', config.username);
    prefs.setBool('darkThemeEnabled', config.darkThemeEnabled);
    setState(() {
      _config.username = config.username;
      _config.darkThemeEnabled = config.darkThemeEnabled;
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
      theme: _config.darkThemeEnabled ? darkTheme : lightTheme,
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