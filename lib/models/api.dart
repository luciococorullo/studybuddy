import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studybuddy/models/Note.dart';

class Api {
  final String uid;
  Api({this.uid});

  final CollectionReference utentiCollection =
      FirebaseFirestore.instance.collection('utenti');

  Future updateUserData(String email) async {
    Note note = Note(
        description: "Benvenuto!\nAggiungi altre note come questa",
        state: "starting");

    return await utentiCollection.doc(uid).set({
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

  Future removeNote(Note note) async {
    var val = [];
    val.add(note.description);
    return await utentiCollection
        .doc(uid)
        .update({'notes': FieldValue.arrayRemove(val)});
  }

  Future updateNote(Note note) async {
    return await utentiCollection.doc(uid).update({'notes': note});
  }
}
