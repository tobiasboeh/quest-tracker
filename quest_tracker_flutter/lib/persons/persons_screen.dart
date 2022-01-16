import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:fluttermoji/fluttermojiCustomizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quest_tracker_flutter/models/person.dart';
import 'package:quest_tracker_flutter/persons/create_person.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  List _pesonArray = [];

  decode() async {
    var output = await FluttermojiFunctions().toString();
    print(output);
    // var o2 = FluttermojiFunctions().decodeFluttermojifromString(output);
    // print(o2);
  }

  loadData() async {
    await Hive
      ..initFlutter();

    var box = await Hive.openBox('database');
    _pesonArray = box.values.toList();
  }

  @override
  Widget build(BuildContext context) {
    loadData();
    return Stack(
      children: [
        Positioned.fill(
          child: ListView.builder(
              itemExtent: 50,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(_pesonArray[index].name ?? "unbekannt"),
                  leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor),
                );
              },
              itemCount: _pesonArray.length),
        ),
        Positioned(
            bottom: 17,
            right: 17,
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return CreatePersomWidget();
                      });
                },
                icon: Icon(
                  FontAwesomeIcons.plus,
                  //size: 20,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ))
      ],
    );
  }
}
