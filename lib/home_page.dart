import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'thought.dart';

enum MenuEntry {
  settings,
  about
}

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

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class HomePage extends StatelessWidget {
  final config;
  HomePage(this.config);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.title),
        actions: <Widget>[
          AppOptions(),
        ],
      ),
      body: MainView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/post'),
      ),
    );
  }
}