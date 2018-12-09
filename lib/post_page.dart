import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'thought.dart';

// This page lets the user post a thought to be displayed on the homepage
class PostPage extends StatelessWidget {
  final config;
  PostPage(this.config);

  // If the app is connected to the internet, it will update the database
  // Changes do apply locally as well, so the new post will be shown even
  // if there is no active internet connection
  void _post(String thought) {
    var _thought = Thought(config.username, thought);
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