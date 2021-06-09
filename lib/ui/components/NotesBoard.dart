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
              height: MediaQuery.of(context).size.height,
              width: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent),
              child: StreamBuilder(
                  stream: db.collection('utenti').doc(uid).get().asStream(),
                  builder: (context, snapshot) {
                    List<Note> listNotes =
                        List<Note>.from(snapshot.data['notes'].map((item) {
                      return Note(
                          description: item['description'],
                          state: item['state']);
                    })).toList();
                    return !snapshot.hasData
                        ? CircularProgressIndicator()
                        : GridView.custom(
                            //TODO: quante note per colonna?
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            childrenDelegate: SliverChildListDelegate(
                              listNotes.map((Note note) {
                                print(note.state);
                                return note.state == "Starting"
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
