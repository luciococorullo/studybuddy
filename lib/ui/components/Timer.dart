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
  final CountdownController _controller1 = new CountdownController();
  final CountdownController _controller2 = new CountdownController();
  final CountdownController _controller3 = new CountdownController();
  bool running = false;
  int info = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            info == 0
                ? Countdown(
                    controller: _controller1,
                    seconds: 1500,
                    build: (_, double time) {
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
                  )
                : info == 1
                    ? Countdown(
                        controller: _controller2,
                        seconds: 300,
                        build: (_, double time) {
                          final String minutesStr = ((time / 60) % 60)
                              .floor()
                              .toString()
                              .padLeft(2, '0');
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
                      )
                    : Countdown(
                        controller: _controller3,
                        seconds: 900,
                        build: (_, double time) {
                          final String minutesStr = ((time / 60) % 60)
                              .floor()
                              .toString()
                              .padLeft(2, '0');
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
            // botton
            !running
                ? TextButton(
                    child: Text("Start",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black45, fontSize: 18))),
                    onPressed: () {
                      _controller1.start();
                      setState(() {
                        running = true;
                      });
                    })
                : TextButton(
                    child: Text("Pause",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black45, fontSize: 18))),
                    onPressed: () {
                      _controller1.pause();
                      setState(() {
                        running = false;
                      });
                    }),
            running
                ? IconButton(
                    icon: Icon(Icons.refresh_rounded),
                    color: primary,
                    onPressed: () {
                      _controller1.restart();
                      _controller1.pause();
                      setState(() {
                        running = false;
                      });
                    })
                : Container(),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),

          //TODO: le voci del menu
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    //border: Border.all(width: 1),
                    ),
                child: TextButton(
                    child: Text("Pomodoro",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black45, fontSize: 12))),
                    onPressed: () {
                      _controller1.restart();
                      _controller1.pause();
                      setState(() {
                        info = 0;
                      });
                    }),
              ),
              TextButton(
                  child: Text("Short Pause",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: Colors.black45, fontSize: 12))),
                  onPressed: () {
                    setState(() {
                      _controller1.restart();
                      _controller1.pause();
                      info = 1;
                    });
                  }),
              TextButton(
                  child: Text("Long Pause",
                      style: GoogleFonts.montserrat(
                          textStyle:
                              TextStyle(color: Colors.black45, fontSize: 12))),
                  onPressed: () {
                    _controller1.restart();
                    _controller1.pause();
                    setState(() {
                      info = 3;
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }
}

void chooseButton() {}
/* 
class Timer extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          "Pomodoro",
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            color: Colors.black45,
            fontSize: 18,
          )),
        ), 
        Spacer(),
        change_timer
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<TimerBloc, TimerState>(
                    //TimerBloc timer;
                    builder: (context, state) {
                      final String minutesStr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final String secondsStr = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        '$minutesStr:$secondsStr',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 50,
                        )),
                      );
                    },
                  ),
                  BlocBuilder<TimerBloc, TimerState>(
                    buildWhen: (previousState, state) =>
                        state.runtimeType != previousState.runtimeType,
                    builder: (context, state) => Actions(),
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<TimerBlocShortPause, TimerState>(
                    //TimerBloc timer;
                    builder: (context, state) {
                      final String minutesStr = ((state.duration / 60) % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      final String secondsStr = (state.duration % 60)
                          .floor()
                          .toString()
                          .padLeft(2, '0');
                      return Text(
                        '$minutesStr:$secondsStr',
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 50,
                        )),
                      );
                    },
                  ),
                  BlocBuilder<TimerBloc, TimerState>(
                    buildWhen: (previousState, state) =>
                        state.runtimeType != previousState.runtimeType,
                    builder: (context, state) => Actions(),
                  ),
                ],
              ),
        Spacer(
          flex: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                child: Text("Pomodoro",
                    style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(color: Colors.black45, fontSize: 16))),
                onPressed: () {
                  setState(() {
                    change_timer = false;
                  });
                }),
            TextButton(
                child: Text("Short Pause",
                    style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(color: Colors.black45, fontSize: 16))),
                onPressed: () {
                  setState(() {
                    change_timer = true;
                  });
                }),
            TextButton(
                child: Text("Long Pause",
                    style: GoogleFonts.montserrat(
                        textStyle:
                            TextStyle(color: Colors.black45, fontSize: 16))),
                onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class Actions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: _mapStateToActionButtons(
          timerBloc: BlocProvider.of<TimerBloc>(context)),
    );
  }

  List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;
    if (currentState is TimerInitial) {
      return [
        TextButton(
            child: Text("Start",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(color: Colors.black45, fontSize: 18))),
            onPressed: () =>
                timerBloc.add(TimerStarted(duration: currentState.duration))),
      ];
    }
    if (currentState is TimerRunInProgress) {
      return [
        TextButton(
          child: Text("Pause",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black45, fontSize: 18))),
          onPressed: () => timerBloc.add(TimerPaused()),
        ),
        Divider(),
        IconButton(
          icon: Icon(Icons.restart_alt_outlined),
          color: primary,
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    if (currentState is TimerRunPause) {
      return [
        TextButton(
          child: Text("Play",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black45, fontSize: 18))),
          onPressed: () => timerBloc.add(TimerResumed()),
        ),
        IconButton(
          icon: Icon(Icons.restart_alt_outlined),
          color: primary,
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    if (currentState is TimerRunComplete) {
      return [
        TextButton(
          child: Icon(Icons.replay),
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    return [];
  }
} 
 */
/* 
class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          TextButton(
            onPressed: () {
              print("Pomodoro pressed");
              setState(() {
                pom = true;
              });
            },
            child: Text("Pomodoro",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        decoration: TextDecoration.underline))),
          ),
          Spacer(
            flex: 1,
          ),
          TextButton(
            onPressed: () {
              print("Break pressed");
              setState(() {
                pom = false;
              });
            },
            child: Text("Break",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        decoration: TextDecoration.underline))),
          ),
          Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
} 
 */
