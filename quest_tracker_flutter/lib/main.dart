import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quest_tracker_flutter/startpage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quest_tracker_flutter/models/person.dart';

void main() {
  Hive
    ..initFlutter()
    ..registerAdapter(PersonAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quest Tracker',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.brown,
            appBarTheme: const AppBarTheme().copyWith(
              titleTextStyle: GoogleFonts.berkshireSwash(
                textStyle: const TextStyle(fontSize: 28),
              ),
            ),
            textTheme: const TextTheme().copyWith(
              subtitle1: GoogleFonts.ptSerif(
                textStyle: const TextStyle(fontSize: 21),
              ),
              bodyText1: GoogleFonts.ptSerif(
                textStyle: const TextStyle(fontSize: 18),
              ),
              bodyText2: GoogleFonts.ptSerif(
                textStyle: const TextStyle(fontSize: 16),
              ),
              headline4: GoogleFonts.ptSerif(
                textStyle: const TextStyle(
                  fontSize: 36,
                ),
              ),
              button: GoogleFonts.ptSerif(
                textStyle: const TextStyle(fontSize: 16),
              ),
            )),
        home: const StartPageScreen());
  }
}
