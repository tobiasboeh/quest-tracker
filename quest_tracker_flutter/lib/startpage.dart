import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quest_tracker_flutter/notes/notes_screen.dart';
import 'package:quest_tracker_flutter/persons/persons_screen.dart';
import 'package:quest_tracker_flutter/places/places_screen.dart';

class StartPageScreen extends StatelessWidget {
  const StartPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Quest Tracker', style: GoogleFonts.berkshireSwash()),
          bottom: const TabBar(tabs: [
            Tab(icon: Icon(FontAwesomeIcons.featherAlt)),
            Tab(icon: Icon(FontAwesomeIcons.mapSigns)),
            Tab(icon: Icon(FontAwesomeIcons.hatWizard)),
          ]),
        ),
        body: const TabBarView(
          children: [
            NotesScreen(),
            PlacesScreen(),
            PersonsScreen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(FontAwesomeIcons.plus),
        ),
      ),
    );
  }
}
