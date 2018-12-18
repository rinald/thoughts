import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'app.dart' show AppConfig;
import 'thought.dart';

// The page where the user can post a new thought.
class PostPage extends StatelessWidget {
  final AppConfig config;
  PostPage(this.config);

  // Post the thought both locally and on the dedicated database.
  // If the app is offline, the thought gets posted locally.
  // If there is an active internet connection (while posting or after), 
  // the post will be automatically added to the database.
  void _post(String thought) {
    var _thought = Thought(config.username, thought);
    // The thought is turned into a json-like object and then added to the database
    Firestore.instance.collection('thoughts').add(_thought.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Type a thought',
              ),
              onFieldSubmitted: (thought) {
                _post(thought);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}