import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';

enum SuggestionType {
  person,
  place,
}

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> getSuggestions(String pattern) async {
    if (pattern.startsWith('g')) {
      return [
        {
          'title': 'Glasstab',
          'type': SuggestionType.person,
        }
      ];
    } else if (pattern.startsWith('p')) {
      return [
        {
          'title': 'Phandalin',
          'type': SuggestionType.place,
        }
      ];
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: TypeAheadField(
        hideOnEmpty: true,
        textFieldConfiguration: TextFieldConfiguration(
          maxLines: null,
          style: GoogleFonts.ptSerif(textStyle: const TextStyle(fontSize: 20)),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
        suggestionsCallback: (pattern) async {
          return getSuggestions(pattern);
        },
        suggestionsBoxDecoration: SuggestionsBoxDecoration(
            color: Colors.brown.shade200,
            elevation: 0,
            borderRadius: BorderRadius.circular(10)),
        itemBuilder: (context, Map<String, dynamic> suggestion) {
          return Text('${suggestion['title']}');
        },
        onSuggestionSelected: (suggestion) {
          // your implementation here
        },
      ),
    );
  }
}
