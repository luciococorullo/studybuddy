import 'package:flutter/material.dart';

import '../../Timer.dart';
import '../../WelcomeBanner.dart';
import 'Sidebar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Sidebar(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              //TODO: aggiungere sidebar (?)
              children: [WelcomeBanner(), TimerContainer()],
            ),
          ),
        ],
      ),
    );
  }
}
