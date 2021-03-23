import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(children: <TextSpan>[
          //TODO: implementare getter del nome
          TextSpan(
              text: "Hey, Lucio!",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 36,
                      fontWeight: FontWeight.bold))),
          TextSpan(
              text: "\nPronto per la sessione invernale?",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)))
        ]),
      ),
    );
  }
}
