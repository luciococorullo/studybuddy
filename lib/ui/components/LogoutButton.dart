import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/auth.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      child: TextButton(
          child: Text("Logout",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 18))),
          onPressed: () async {
            dynamic result = await anonymousAuth();
            print("Result: " + result);
          }),
    );
  }
}
