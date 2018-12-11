# Thoughts

Thoughts is a simple thought-sharing mobile app written with [Flutter](https://flutter.io).

While this project was started as a learning exercise, it could very well serve as a non-trivial demo for anyone getting started with Flutter. It makes use of various plugins to add desired functionality.

Some interesting aspects of this app include:
- The usage of routes to go from one page to another
- The option to change the app theme (for all dark theme lovers out there)
- The ability to change the state of a parent widget by using callbacks (we can change the state of the app in settings)
- The replacement of the default app icon with a custom one (through the **flutter_launcher_icons** plugin)
- The ability to update in real time (through the **StreamBuilder** widget and the **cloud_firestore** plugin)
- The ability to retain app preferences even after being closed (throught the **shared_preferences** plugin; e.g The app will remember your username and theme preference)

