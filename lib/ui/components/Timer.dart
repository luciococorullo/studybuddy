import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/bloc/timer_bloc/timer_bloc.dart';
import 'package:studybuddy/models/Ticker.dart';
import 'package:studybuddy/shared/costants.dart';

class TimerContainer extends StatelessWidget {
  //TODO: sistemare grafica complessiva

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      decoration:
          BoxDecoration(color: glass, borderRadius: BorderRadius.circular(10)),
      child: BlocProvider(
        create: (context) => TimerBloc(ticker: Ticker()),
        child: Timer(),
      ),
    );
  }
}

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
          "Timer Pomodoro",
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
            color: Colors.black45,
            fontSize: 18,
          )),
        ),
        Spacer(),
        Row(
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
                final String secondsStr =
                    (state.duration % 60).floor().toString().padLeft(2, '0');
                return Text(
                  '$minutesStr:$secondsStr',
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                    color: Colors.black45,
                    fontSize: 36,
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
        )
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
        TextButton(
          child: Text("Stop",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black45, fontSize: 18))),
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
        TextButton(
          child: Text("Stop",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.black45, fontSize: 18))),
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