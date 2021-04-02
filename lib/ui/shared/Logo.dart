import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "StudyBuddy",
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(color: Colors.white, fontSize: 36),
          ),
          textAlign: TextAlign.left,
        ),
        CircleAvatar(
            backgroundImage: NetworkImage(
                'https://miro.medium.com/max/1838/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg')),
      ],
    );
  }
}
