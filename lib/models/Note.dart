import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Type { DONE, DOING, TODO }

class Note {
  String description;
  String state;

  Note({@required this.description, @required this.state});
}
