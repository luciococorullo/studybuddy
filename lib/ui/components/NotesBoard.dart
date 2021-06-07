import 'package:flutter/material.dart';
import 'package:studybuddy/models/Note.dart';
import 'package:studybuddy/ui/components/NoteCard.dart';

class NotesBoard extends StatelessWidget {
  List<Note> listNote = [
    Note(title: "prova", description: "Nota di prova", state: Type.TODO),
    Note(title: "prova2", description: "Nota2 di prova", state: Type.DOING),
    Note(title: "prova3", description: "Nota3 di prova", state: Type.DOING),
    Note(title: "prova4", description: "Nota4 di prova", state: Type.DOING),
    Note(title: "prova5", description: "Nota5 di prova", state: Type.DONE),
  ];

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            height: 700,
            width: 700,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent),
            child: GridView.custom(
              //TODO: quante note per colonna?
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              childrenDelegate: SliverChildListDelegate(
                listNote.map((Note note) {
                  return NoteCard(
                    note: note,
                  );
                }).toList(),
              ),
              padding: const EdgeInsets.all(5.0),
            )));
  }
}