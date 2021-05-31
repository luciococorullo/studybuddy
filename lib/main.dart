import 'package:flutter/material.dart';

import 'ui/shared/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study Buddy',
      home: Homepage(),
    );
  }
}
