import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Places',
            style: GoogleFonts.berkshireSwash(
              textStyle: Theme.of(context).textTheme.headline1,
            )));
  }
}
