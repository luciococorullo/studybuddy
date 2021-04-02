import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/shared/costants.dart';

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
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(10), color: glass),
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
              getType(widget.note.state),
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

Widget getType(Type type) {
  String state;
  Color color;

  switch (type) {
    case Type.DOING:
      state = "Doing";
      color = Colors.orange;
      break;
    case Type.DONE:
      state = "Done";
      color = Colors.green;
      break;
    case Type.TODO:
      state = "Todo";
      color = Colors.red;
      break;
  }
  return Container(
    height: 20,
    width: 70,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
    child: Text(
      state,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
    ),
  );
}
