import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoVersion extends StatelessWidget {
  double version;

  InfoVersion({@required this.version});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      "Studybuddy V$version",
      style: GoogleFonts.montserrat(
        textStyle: TextStyle(color: Colors.white, fontSize: 12),
      ),
    ));
  }
}
