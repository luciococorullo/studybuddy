import 'package:flutter/material.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/components/Profile.dart';
import 'package:studybuddy/ui/components/StudyStreams.dart';
import 'package:studybuddy/ui/components/WeatherWidget.dart';
import 'package:studybuddy/ui/components/InfoVersion.dart';
import 'package:studybuddy/ui/components/Timer.dart';

import 'LoginButton.dart';
import 'Logo.dart';
import 'LogoutButton.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            Spacer(flex: 1),
            Profile(),
            Spacer(flex: 1),
            WeatherWidget(),
            Spacer(flex: 1),
            TimerContainer(),
            Spacer(flex: 1),
            StudyStreams(),
            //TODO: agg widgets
            Spacer(
              flex: 10,
            ),
            LoginButton(),
            LogoutButton(),
            InfoVersion(version: 0.1),
          ],
        ),
      ),
    );
  }
}
