import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quest_tracker_flutter/models/person.dart';
import 'package:quest_tracker_flutter/persons/create_person.dart';
import 'package:quest_tracker_flutter/persons/person_detail.dart';

class PersonsScreen extends StatefulWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  State<PersonsScreen> createState() => _PersonsScreenState();
}

class _PersonsScreenState extends State<PersonsScreen> {
  List _pesonArray = [];

  decode() async {
    var output = FluttermojiFunctions().toString();
    // var o2 = FluttermojiFunctions().decodeFluttermojifromString(output);
    // print(o2);
  }

  Future<Box> openHiveBox(String boxName) async {
    if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var box = await openHiveBox('database');
    setState(() {
      _pesonArray = box.values.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ListView.builder(
              itemExtent: 60,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(
                    _pesonArray[index].name ?? "unbekannt",
                  ),
                  subtitle: Text(
                    _pesonArray[index].classType ?? "",
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor,
                    radius: 25,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _pesonArray[index].delete();
                      loadData();
                    },
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => PersonDetail(
                                person: _pesonArray[index],
                              )),
                    );
                  },
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
                        return CreatePersomWidget(
                          personCreated: loadData,
                        );
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
