import 'package:cloud_firestore/cloud_firestore.dart';

import 'Note.dart';

class User {
  String email;
  String id;
  List<Note> notes;
}
