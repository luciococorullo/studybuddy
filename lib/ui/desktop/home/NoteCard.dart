import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/Note.dart';

class NoteCard extends StatefulWidget {
  Note note;
  NoteCard({@required this.note});
  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.note.title,
            style: GoogleFonts.montserrat(
                textStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Text(widget.note.description,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(fontSize: 14),
              )),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.note.state.toString()),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red),
                child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    onPressed: () => print(
                        "Edit button pressed on note ${widget.note.title}")),
              )
            ],
          )
        ],
      ),
    );
  }
}
