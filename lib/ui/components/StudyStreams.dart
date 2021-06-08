import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';
import 'dart:html' as html;

class StudyStreams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        //TODO: definire size responsive
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            color: glass, borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "StudyStream",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Colors.black45,
                fontSize: 18,
              )),
            ),
            Spacer(),
            Row(
              children: [
                Spacer(
                  flex: 2,
                ),
                RoomButton(
                  title: "Room One",
                  link:
                      "https://us02web.zoom.us/j/85994060850?pwd=OGU0Zzgwb3NCZ2FpT0E4SU9uSHNWdz09",
                ),
                Spacer(
                  flex: 1,
                ),
                RoomButton(
                  title: "Room Two",
                  link:
                      "https://us02web.zoom.us/j/85897513021?pwd=RGFIZGFCaFdUUUMyV0xGK1JiaUlUZz09",
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              "Rooms are provided by studystream.live",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black45, fontSize: 11)),
            ),
          ],
        ));
  }
}

class RoomButton extends StatelessWidget {
  final String title;
  final String link;
  RoomButton({this.title, this.link});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
          color: primary, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: TextButton(
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: glass, fontSize: 12)),
            ),
            onPressed: () => html.window.open(link, "_blank")),
      ),
    );
  }
}
