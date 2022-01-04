import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonsScreen extends StatelessWidget {
  const PersonsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'Persons',
      style: GoogleFonts.berkshireSwash(
          textStyle: Theme.of(context).textTheme.headline1),
    ));
  }
}
