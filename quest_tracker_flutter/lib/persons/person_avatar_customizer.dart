import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:quest_tracker_flutter/models/person.dart';

class AvatarCustomizer extends StatelessWidget {
  const AvatarCustomizer({required this.person, Key? key}) : super(key: key);
  final Person person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name ?? "Unbekannt"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: FluttermojiCircleAvatar(
              radius: 140,
            ),
          ),
          FluttermojiCustomizer()
        ],
      ),
    );
  }
}
