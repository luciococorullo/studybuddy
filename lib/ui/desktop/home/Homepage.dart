import 'package:flutter/material.dart';

import '../../Timer.dart';
import '../../WelcomeBanner.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        children: [WelcomeBanner(), TimerContainer()],
      ),
    );
  }
}
