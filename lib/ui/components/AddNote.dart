import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/pages/AddNoteDialog.dart';

class AddNote extends StatefulWidget {
  final Note note;
  AddNote({@required this.note});
  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
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
                textStyle: TextStyle(fontSize: 14),
              )),
          Spacer(),
          Align(
              alignment: Alignment.center,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: glass),
                child: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddNoteDialog(),
                      );
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.black45,
                    )),
              )),
          Spacer(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.only(bottom: 7),
              height: 20,
              width: 70,
              decoration: BoxDecoration(
                  color: primary, borderRadius: BorderRadius.circular(50)),
              child: Text(
                widget.note.state,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
