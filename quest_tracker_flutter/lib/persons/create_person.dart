import 'package:flutter/material.dart';
import 'package:quest_tracker_flutter/models/person.dart';
import 'package:hive/hive.dart';

class CreatePersomWidget extends StatefulWidget {
  const CreatePersomWidget({required this.personCreated, Key? key})
      : super(key: key);
  final Function personCreated;
  @override
  State<CreatePersomWidget> createState() => _CreatePersomWidgetState();
}

class _CreatePersomWidgetState extends State<CreatePersomWidget> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _class = TextEditingController();
  final TextEditingController _desc = TextEditingController();

  savePerson() async {
    var box = await Hive.openBox('database');

    var person = Person()
      ..name = _name.value.text
      ..classType = _class.value.text
      ..desc = _desc.value.text;

    box.add(person);
    widget.personCreated();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          TextField(
            controller: _name,
            decoration: const InputDecoration(hintText: 'Charactername'),
          ),
          TextField(
            controller: _class,
            decoration: const InputDecoration(hintText: 'Klasse'),
          ),
          TextField(
            controller: _desc,
            decoration: const InputDecoration(hintText: 'Beschreibung'),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                onPressed: savePerson, child: const Text("Speichern")),
          )
        ],
      ),
    );
  }
}
