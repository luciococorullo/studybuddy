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
                  title: "Stanza 1",
                  link:
                      "https://us02web.zoom.us/j/85994060850?pwd=OGU0Zzgwb3NCZ2FpT0E4SU9uSHNWdz09",
                ),
                Spacer(
                  flex: 1,
                ),
                RoomButton(
                  title: "Stanza 2",
                  link:
                      "https://us02web.zoom.us/j/85897513021?pwd=RGFIZGFCaFdUUUMyV0xGK1JiaUlUZz09",
                ),
                Spacer(
                  flex: 2,
                ),
              ],
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
      height: 80,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: primary),
      child: Center(
        child: TextButton(
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => html.window.open(link, "_blank")),
      ),
    );
  }
}
