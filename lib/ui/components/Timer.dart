import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class TimerContainer extends StatelessWidget {
  //TODO: sistemare grafica complessiva

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        decoration: BoxDecoration(
            color: glass, borderRadius: BorderRadius.circular(10)),
        child: Timer());
  }
}

class Timer extends StatefulWidget {
  const Timer({Key key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  // Controller
  final CountdownController controllerPomodoro = new CountdownController();
  final CountdownController controllerShort = new CountdownController();
  bool running = false;
  int duration = 1500;
  bool pomodoro = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // visualizza il timer in base alla richiesta
        pomodoro
            ? CustomCountDown(
                seconds: 1500,
                controller: controllerPomodoro,
              )
            : CustomCountDown(
                seconds: 300,
                controller: controllerShort,
              ),
      ],
    );
  }
}

class CustomCountDown extends StatefulWidget {
  final int seconds;
  final CountdownController controller;
  CustomCountDown({Key key, this.seconds, this.controller}) : super(key: key);

  @override
  _CustomCountDownState createState() => _CustomCountDownState();
}

class _CustomCountDownState extends State<CustomCountDown> {
  bool running = false;
  bool pomodoro = true;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Countdown(
              controller: widget.controller,
              seconds: pomodoro ? 1500 : 300,
              build: (BuildContext context, double time) {
                final String minutesStr =
                    ((time / 60) % 60).floor().toString().padLeft(2, '0');
                final String secondsStr =
                    (time % 60).floor().toString().padLeft(2, '0');
                return Text(
                  '$minutesStr:$secondsStr',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black87,
                    fontSize: 50,
                  )),
                );
              },
              interval: Duration(milliseconds: 100),
              onFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Timer is done!'),
                  ),
                );
              },
            ),
            !running
                ? IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color: primary,
                    ),
                    onPressed: () {
                      widget.controller.start();
                      setState(() {
                        running = true;
                      });
                    })
                : IconButton(
                    icon: Icon(
                      Icons.pause,
                      color: primary,
                    ),
                    onPressed: () {
                      widget.controller.pause();
                      setState(() {
                        running = false;
                      });
                    }),
            IconButton(
                icon: Icon(Icons.refresh_rounded),
                color: primary,
                onPressed: () {
                  widget.controller.restart();
                  widget.controller.pause();
                  setState(() {
                    running = false;
                  });
                })
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 2.0, color: primary),
            ),
          ),
          child: TextButton(
            onPressed: () {
              widget.controller.restart();
              widget.controller.pause();
              setState(() {
                running = false;
                pomodoro = !pomodoro;
                i++;
              });
            },
            child: Text(
              i == 0
                  ? "Switch to Break"
                  : i == 1
                      ? "Press again"
                      : pomodoro
                          ? "Switch to Pomodoro"
                          : "Switch to Break",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black45, fontSize: 12)),
            ),
          ),
        )
      ],
    );
  }
}
