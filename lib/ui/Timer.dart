import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/bloc/timer_bloc/timer_bloc.dart';
import 'package:studybuddy/models/Ticker.dart';

class TimerContainer extends StatelessWidget {
  //TODO: sistemare grafica complessiva
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        //TODO: definire altezza responsive
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(10)),
        child: BlocProvider(
          create: (context) => TimerBloc(ticker: Ticker()),
          child: Timer(),
        ),
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BlocBuilder<TimerBloc, TimerState>(
          builder: (context, state) {
            //TODO: aggiungere ore(?)
            final String minutesStr =
                ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
            final String secondsStr =
                (state.duration % 60).floor().toString().padLeft(2, '0');
            return Text(
              '$minutesStr:$secondsStr',
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                color: Colors.white,
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
                    textStyle: TextStyle(color: Colors.white, fontSize: 18))),
            onPressed: () =>
                timerBloc.add(TimerStarted(duration: currentState.duration))),
      ];
    }
    if (currentState is TimerRunInProgress) {
      return [
        TextButton(
          child: Text("Pause",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 18))),
          onPressed: () => timerBloc.add(TimerPaused()),
        ),
        Divider(),
        TextButton(
          child: Text("Stop",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 18))),
          onPressed: () => timerBloc.add(TimerReset()),
        ),
      ];
    }
    if (currentState is TimerRunPause) {
      return [
        TextButton(
          child: Text("Play",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 18))),
          onPressed: () => timerBloc.add(TimerResumed()),
        ),
        TextButton(
          child: Text("Stop",
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(color: Colors.white, fontSize: 18))),
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
