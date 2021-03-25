import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: "Study",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.white, fontSize: 36))),
        TextSpan(
            text: " Buddy",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.red, fontSize: 30)))
      ]),
    );
  }
}
