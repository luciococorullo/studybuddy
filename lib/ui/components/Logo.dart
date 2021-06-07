import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "StudyBuddy",
      style: GoogleFonts.montserrat(
        textStyle:
            TextStyle(color: Colors.white, fontSize: 36, letterSpacing: 2),
      ),
      textAlign: TextAlign.left,
    );
  }
}
