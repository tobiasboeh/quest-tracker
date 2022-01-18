import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:quest_tracker_flutter/models/person.dart';
import 'package:quest_tracker_flutter/persons/person_avatar_customizer.dart';

class PersonDetail extends StatelessWidget {
  const PersonDetail({required this.person, Key? key}) : super(key: key);
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name ?? 'unbekannt'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 5.0),
            child: GestureDetector(
              child: FluttermojiCircleAvatar(
                radius: 100,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AvatarCustomizer(person: person),
                  ),
                );
              },
            ),
          ),
          Center(
              child: Text(
            person.classType ?? "",
            style: Theme.of(context).textTheme.headline4,
          )),
        ],
      ),
    );
  }
}
