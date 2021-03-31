import 'package:flutter/material.dart';

enum Type { DONE, DOING, TODO }

class Note {
  String title;
  String description;
  Type state;

  Note(
      {@required this.title, @required this.description, @required this.state});
}
