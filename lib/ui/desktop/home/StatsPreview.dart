import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';

class StatsPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      decoration:
          BoxDecoration(color: glass, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _generateStats(),
      ),
    );
  }
}

class StatsBox extends StatelessWidget {
  final String name;
  final double stat;
  const StatsBox({@required this.name, @required this.stat});
  @override
  Widget build(BuildContext context) {
    return Container(
        //TODO: definire size
        width: 70,
        height: 70,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 12))),
              Text(stat.toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 18)))
            ]));
  }
}

List<Widget> _generateStats() {
  return [
    StatsBox(name: "Time", stat: 125.3),
    StatsBox(name: "Position", stat: 5),
    StatsBox(name: "Days", stat: 10)
  ];
}
