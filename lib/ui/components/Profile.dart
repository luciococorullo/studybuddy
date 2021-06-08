import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/pages/AuthDialog.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 100,
        width: 300,
        decoration: BoxDecoration(
            color: glass, borderRadius: BorderRadius.circular(10)),
        child: userEmail == null
            ? ListTile(
                title: Text(
                  "Unknown Student",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                  )),
                ),
                subtitle: Text(
                  "Press to sign in",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                  )),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AuthDialog(),
                  );
                },
                trailing: CircleAvatar(
                    radius: 25,
                    backgroundColor: primary,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    )))
            : ListTile(
                title: Text(
                  name ?? userEmail.split('@').first,
                  maxLines: 1,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 18,
                  )),
                ),
                subtitle: Text(
                  "Ready to study?",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                  )),
                ),
                trailing: CircleAvatar(
                  radius: 25,
                  backgroundColor: primary,
                  backgroundImage:
                      imageUrl != null ? NetworkImage(imageUrl) : null,
                  child: imageUrl == null
                      ? Image.asset(
                          'images/man.png',
                          scale: 4,
                        )
                      : null,
                ),
              ));
  }
}
