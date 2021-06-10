import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/ui/components/AddNote.dart';
import 'package:studybuddy/ui/components/NoteCard.dart';

class NotesBoard extends StatefulWidget {
  @override
  _NotesBoardState createState() => _NotesBoardState();
}

class _NotesBoardState extends State<NotesBoard> {
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
                  stream: refreshNotesBoard(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Note> listNotes =
                          List<Note>.from(snapshot.data['notes'].map((item) {
                        return Note(
                            description: item['description'],
                            state: item['state']);
                      })).toList();
                      return listNotes.isEmpty
                          ? CircularProgressIndicator()
                          : GridView.custom(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              childrenDelegate: SliverChildListDelegate(
                                listNotes.map((Note note) {
                                  return note.state == "Starting"
                                      ? AddNote(note: note)
                                      : NoteCard(
                                          note: note,
                                        );
                                }).toList(),
                              ));
                    } else {
                      return Center(
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              )));
                    }
                  }),
              padding: const EdgeInsets.all(5.0),
            ))
        : Container();
  }
}

Stream refreshNotesBoard() {
  return FirebaseFirestore.instance
      .collection('utenti')
      .doc(uid)
      .get()
      .asStream();
}
