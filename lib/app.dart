import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'post_page.dart';
import 'about_page.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
);

// This class is used to manage app configurations.
class AppConfig {
  String username;
  bool darkThemeEnabled;

  AppConfig({ 
    this.username, 
    this.darkThemeEnabled
  });
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // The default configuration for the app
  var _config = AppConfig(
    username: '',
    darkThemeEnabled: false,
  );
  
  // Initialise the app configuration based on user preferences.
  void _init() async {
    var prefs = await SharedPreferences.getInstance();

    setState(() {
      _config.username = prefs.getString('username') ?? _config.username;
      _config.darkThemeEnabled = prefs.getBool('darkThemeEnabled') ?? _config.darkThemeEnabled;      
    });
  }

  // Update the app configuration.
  void _update(AppConfig config) async {
    setState(() {
      _config.username = config.username;
      _config.darkThemeEnabled = config.darkThemeEnabled;
    });
    
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('username', config.username);
    prefs.setBool('darkThemeEnabled', config.darkThemeEnabled);
  }

  // Initialise the state of the app.
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thoughts',
      theme: _config.darkThemeEnabled ? darkTheme : lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => SettingsPage(_config, callback: _update),
        '/about': (context) => AboutPage(),
        '/post': (context) => PostPage(_config),
      },
    );
  }
}