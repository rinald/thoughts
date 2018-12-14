# Thoughts

**Thoughts** is a simple thought-sharing mobile app written with **[Flutter]**.

While this project started as a learning exercise, it could very well serve as a non-trivial demo for anyone getting started with **[Flutter]**. It makes use of various plugins to add some interesting functionality.

Some interesting aspects of this app include:
- The usage of routes to go from one page to another.
- The option to change the app theme.
- The ability to change the state of a parent widget by using callbacks (we can change the state of the app in settings).
- The replacement of the default app icon with a custom one (through the **[flutter_launcher_icons]** plugin).
- The ability to update in real time (through the **[StreamBuilder]** widget and the **[cloud_firestore]** plugin).
- The ability to retain app preferences even after being closed (throught the **[shared_preferences]** plugin; e.g The app will remember your username and theme preference).

**Note: When you first open the app, be sure to set your username in Settings.**

[Flutter]: https://flutter.io
[StreamBuilder]: https://docs.flutter.io/flutter/widgets/StreamBuilder-class.html
[flutter_launcher_icons]: https://pub.dartlang.org/packages/flutter_launcher_icons
[cloud_firestore]: https://pub.dartlang.org/packages/cloud_firestore
[shared_preferences]: https://pub.dartlang.org/packages/shared_preferences