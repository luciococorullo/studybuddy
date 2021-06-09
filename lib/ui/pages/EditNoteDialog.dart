import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/models/api.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/components/NotesBoard.dart';

import 'Homepage.dart';

class EditNoteDialog extends StatefulWidget {
  final Note note;
  EditNoteDialog({@required this.note});
  @override
  _EditNoteDialogState createState() => _EditNoteDialogState();
}

class _EditNoteDialogState extends State<EditNoteDialog> {
  TextEditingController textNoteController;

  String noteState = "To-Do";
  String noteText = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: secondary,
      child: Container(
        width: 400,
        height: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: secondary),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Edit note ",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Spacer(),
                Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      color: Colors.red.shade300,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextButton(
                        onPressed: () {
                          print(noteText + noteState);
                          try {
                            print("Preso uid: " + uid);
                            Api(uid: uid).removeNote(widget.note);
                          } catch (e) {
                            print(e.toString());
                          }
                          Navigator.of(context).pop();

                          Navigator.of(context).push(MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Homepage(),
                          ));
                        },
                        child: Text(
                          "Delete",
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        )),
                  ),
                ),
              ],
            ),
            Spacer(flex: 1),
            TextField(
              controller: textNoteController,
              maxLines: 4,
              autofocus: false,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blueGrey[800],
                    width: 3,
                  ),
                ),
                filled: true,
                hintStyle: new TextStyle(
                  color: Colors.blueGrey[300],
                ),
                hintText: "Text here...",
                fillColor: glass,
              ),
              onChanged: (value) {
                setState(() {
                  noteText = value;
                });
              },
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Note status: ",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                ),
                DropdownButton<String>(
                  dropdownColor: primary,
                  items: <String>['To-Do', 'Doing', 'Done'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  value: noteState,
                  onChanged: (value) {
                    setState(() {
                      noteState = value;
                    });
                  },
                ),
                Spacer(),
                Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextButton(
                        onPressed: () async {
                          noteText == ""
                              ? noteText = widget.note.description
                              : null;
                          try {
                            print("Preso uid: " + uid);
                            Api(uid: uid).updateNote(
                                widget.note,
                                new Note(
                                    description:
                                        noteText ?? widget.note.description,
                                    state: noteState.toLowerCase()));
                          } catch (e) {
                            print(e.toString());
                          }

                          await Future.delayed(Duration(seconds: 1));
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Homepage(),
                          ));
                        },
                        child: Text(
                          "Save",
                          style: GoogleFonts.montserrat(
                              textStyle:
                                  TextStyle(color: Colors.white, fontSize: 12)),
                        )),
                  ),
                ),
              ],
            ),
            //Spacer(),
          ],
        ),
      ),
    );
  }
}
