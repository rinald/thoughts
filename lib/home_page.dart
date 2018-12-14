import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'thought.dart';

// The type used by [AppOptions].
enum MenuEntry {
  settings,
  about
}

// Show a popup menu of app options.
class AppOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (_) => <PopupMenuEntry<MenuEntry>>[
        PopupMenuItem(
          value: MenuEntry.settings,
          child: Text('Settings'),
        ),
        PopupMenuItem(
          value: MenuEntry.about,
          child: Text('About'),
        ),
      ],
      onSelected: (MenuEntry entry) {
        switch (entry) {
          case MenuEntry.settings:
            Navigator.of(context).pushNamed('/settings');
          break;
          case MenuEntry.about:
            Navigator.of(context).pushNamed('/about');
          break;
        }
      },
    );
  }
}

// Display a list of all uploaded thoughts (as [ThoughtTile]s).
// Thoughts are read from the database and stored locally.
// If the app is offline, stored thoughts are always showed.
// When there are new thoughts and the app is online, they are adden in real time.
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The use of [StreamBuilder] makes it possible to show new thoughts in real time
    // Refer to the documentation of [Stream](Dart) and [StreamBuilder](Flutter) for more details
    return StreamBuilder(
      stream: Firestore.instance.collection('thoughts').snapshots(),
      builder: (_, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (_, index) {
            var document = snapshot.data.documents[index];
            return ThoughtTile(Thought.fromJson(document));
          },
        );
      },
    );
  }
}

// The main page of the app.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thoughts'),
        actions: <Widget>[
          AppOptions(),
        ],
      ),
      body: MainView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Post a thought',
        onPressed: () => Navigator.of(context).pushNamed('/post'),
      ),
    );
  }
}