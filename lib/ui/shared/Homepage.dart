import 'package:flutter/material.dart';
import 'package:studybuddy/ui/desktop/home/NotesBoard.dart';
import 'package:studybuddy/ui/desktop/home/WeatherWidget.dart';
import 'package:studybuddy/ui/phone/PhoneHomepage.dart';
import 'package:studybuddy/shared/ResponsiveView.dart';

import 'Timer.dart';
import 'WelcomeBanner.dart';
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
    return Row(
      children: [
        Sidebar(),
        Container(
          height: MediaQuery.of(context).size.height,
          //TODO: fix larghezza
          width: 1000,
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              WelcomeBanner(),
              TimerContainer(),
              WeatherWidget(),
              NotesBoard()
            ],
          ),
        ),
      ],
    );
  }
}
