import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/Logo.dart';
import '../../shared/LogoutButton.dart';
import 'ProfilePreview.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.25,
      //TODO: Ridefinire il colore (come nel resto dell'app)
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Logo(),
          Spacer(flex: 1),
          ProfilePreview(),
          Spacer(flex: 1),
          SidebarItem(title: "Profile", icon: Icons.person),
          SidebarItem(title: "Stats", icon: Icons.bar_chart),
          SidebarItem(title: "Settings", icon: Icons.settings),
          Spacer(
            flex: 10,
          ),
          LogoutButton(),
          //TODO: inserire info sulla versione (?)
        ],
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
