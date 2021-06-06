import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 100,
        width: 300,
        decoration: BoxDecoration(
            color: glass, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            "Lucio Cocorullo",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Colors.black45,
              fontSize: 18,
            )),
          ),
          subtitle: Text(
            "Universitá Parthenope",
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
              color: Colors.black45,
              fontSize: 15,
            )),
          ),
          trailing: CircleAvatar(
            radius: 25,
            backgroundColor: primary,
            child: Image.asset(
              'images/man.png',
              scale: 4,
            ),
          ),
        ));
  }
}
