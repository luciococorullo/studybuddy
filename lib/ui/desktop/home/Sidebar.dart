import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/desktop/home/StatsPreview.dart';
import 'package:studybuddy/ui/desktop/home/WeatherWidget.dart';
import 'package:studybuddy/ui/shared/InfoVersion.dart';
import 'package:studybuddy/ui/shared/Timer.dart';

import '../../shared/Logo.dart';
import '../../shared/LogoutButton.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.25,
        //TODO: Ridefinire il colore (come nel resto dell'app)
        decoration: BoxDecoration(
            color: secondary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(),
            Spacer(flex: 1),
            TimerContainer(),
            /* SidebarItem(title: "Profile", icon: Icons.person),
            SidebarItem(title: "Stats", icon: Icons.bar_chart),
            SidebarItem(title: "Settings", icon: Icons.settings), */
            Spacer(flex: 1),
            WeatherWidget(),
            Spacer(flex: 1),
            StatsPreview(),
            Spacer(
              flex: 10,
            ),
            LogoutButton(),
            InfoVersion(version: 0.1),
            //TODO: inserire info sulla versione (?)
          ],
        ),
      ),
    );
  }
}

class SidebarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  const SidebarItem({@required this.title, @required this.icon, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(title,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(color: Colors.white, fontSize: 18))),
        leading: Icon(
          icon,
          color: Colors.white,
        ),
        onTap: () => print("$title button pressed"),
      ),
    );
  }
}
