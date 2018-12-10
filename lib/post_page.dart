import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'thought.dart';

class PostPage extends StatelessWidget {
  final config;
  PostPage(this.config);

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