import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/Note.dart';

class Api {
  final String uid;
  Api({this.uid});

  final CollectionReference utentiCollection =
      FirebaseFirestore.instance.collection('utenti');

  Future updateUserData(String email) async {
    Note note = Note(description: " ", state: "Starting");

    DocumentSnapshot ds = await utentiCollection.doc(uid).get();

    return ds.exists
        ? await utentiCollection.doc(uid).update({
            'email': email,
            'notes': FieldValue.arrayUnion([
              {'description': note.description, 'state': note.state}
            ])
          })
        : await utentiCollection.doc(uid).set({
            'email': email,
            'notes': FieldValue.arrayUnion([
              {'description': note.description, 'state': note.state}
            ])
          });
  }

  Future addNote(Note note) async {
    print(uid);
    return await utentiCollection.doc(uid).update({
      'notes': FieldValue.arrayUnion([
        {'description': note.description, 'state': note.state}
      ])
    });
  }

//TODO:non funziona
  Future removeNote(Note note) async {
    try {
      print(utentiCollection.doc(uid).get().toString());
      return await utentiCollection.doc(uid).update({
        'notes': FieldValue.arrayRemove([
          {'description': note.description, 'state': note.state}
        ])
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateNote(Note oldNote, Note newNote) async {
    try {
      await removeNote(oldNote);
      return await utentiCollection.doc(uid).update({
        'notes': FieldValue.arrayUnion([
          {'description': newNote.description, 'state': newNote.state}
        ])
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
