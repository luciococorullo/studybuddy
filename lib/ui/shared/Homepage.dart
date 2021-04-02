import 'package:flutter/material.dart';
import 'package:studybuddy/ui/desktop/home/NotesBoard.dart';
import 'package:studybuddy/ui/desktop/home/Wallpaper.dart';
import 'package:studybuddy/ui/phone/PhoneHomepage.dart';
import 'package:studybuddy/shared/ResponsiveView.dart';
import '../desktop/home/Sidebar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveWidget.isSmallScreen(context)
            ? PhoneHomepage()
            : DesktopHomepage());
  }
}

class DesktopHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Wallpaper(),
        NotesBoard(),
        Sidebar(),
      ],
    );
  }
}
