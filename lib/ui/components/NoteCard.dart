import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/pages/EditNoteDialog.dart';

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
          Text(widget.note.description,
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(fontSize: 16, color: Colors.white),
              )),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getType(widget.note.state),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100), color: primary),
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => EditNoteDialog(
                        note: widget.note,
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget getType(String type) {
  String state;
  Color color;

  switch (type) {
    case "doing":
      state = "Doing";
      color = Colors.orange.shade300;
      break;
    case "done":
      state = "Done";
      color = Colors.green.shade300;
      break;
    case "to-do":
      state = "To-do";
      color = Colors.red.shade300;
      break;
    default:
      state = " ";
      color = glass;
  }
  return Container(
    height: 25,
    width: 70,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Text(
        state,
        //textAlign: TextAlign.center,
        style:
            GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white)),
      ),
    ),
  );
}
