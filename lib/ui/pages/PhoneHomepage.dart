import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/components/Logo.dart';

class PhoneHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            Logo(),
            //add image here
            Spacer(
              flex: 1,
            ),
            Image.asset(
              'assets/images/img4.png',
              width: 450,
            ),
            Text(
              "Sorry, this screen is not supported yet.\nVisit our web app from a Computer to try your personal StudyBuddy!",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(fontSize: 18, color: Colors.black45)),
            ),
            Spacer(
              flex: 3,
            )
          ],
        ),
      ),
    );
  }
}
