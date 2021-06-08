import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/models/api.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/ui/components/NotesBoard.dart';

import 'Homepage.dart';

class AddNoteDialog extends StatefulWidget {
  @override
  _AddNoteDialogState createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  TextEditingController textNoteController;

  String noteState = "To-Do";
  String noteText = "";
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 400,
        height: 400,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: textNoteController,
              maxLines: 3,
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
                hintText: "Inserisci nota",
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  noteText = value;
                });
              },
            ),
            Row(
              children: [
                Text(
                  "Note status: ",
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.black45, fontSize: 18),
                  ),
                ),
                DropdownButton<String>(
                  items: <String>['To-Do', 'Doing', 'Done'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.montserrat(),
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
              ],
            ),
            TextButton(
                onPressed: () {
                  print(noteText + noteState);
                  Note newNote = new Note(
                      description: noteText, state: noteState.toLowerCase());
                  print(newNote.description + newNote.state);
                  try {
                    print("Preso uid: " + uid);
                    Api(uid: uid).addNote(newNote);
                  } catch (e) {
                    print(e.toString());
                  }
                  Navigator.of(context).pop();
                  //TODO: trovare una situa migliore
                  Navigator.of(context).push(MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => Homepage(),
                  ));
                },
                child: Text("Salva"))
          ],
        ),
      ),
    );
  }
}
