import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/ui/components/AddNote.dart';
import 'package:studybuddy/ui/components/NoteCard.dart';

class NotesBoard extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return userEmail != null
        ? Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 700,
              width: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent),
              child: FutureBuilder(
                  future: db.collection('utenti').doc(uid).get(),
                  builder: (context, snapshot) {
                    List<Note> listNotes =
                        List<Note>.from(snapshot.data['notes'].map((item) {
                      return Note(
                          description: item['description'],
                          state: item['state']);
                    })).toList();

                    return GridView.custom(
                        //TODO: quante note per colonna?
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        childrenDelegate: SliverChildListDelegate(
                          listNotes.map((Note note) {
                            print(note.state);
                            return note.state == "starting"
                                ? AddNote(note: note)
                                : NoteCard(
                                    note: note,
                                  );
                          }).toList(),
                        ));
                  }),
              padding: const EdgeInsets.all(5.0),
            ))
        : Container();
  }
}
