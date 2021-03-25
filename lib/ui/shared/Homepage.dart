import 'package:flutter/material.dart';
import 'package:studybuddy/ui/phone/PhoneHomepage.dart';
import 'package:studybuddy/shared/ResponsiveView.dart';

import 'Timer.dart';
import 'WelcomeBanner.dart';
import '../desktop/home/Sidebar.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWidget.isSmallScreen(context)
          ? PhoneHomepage()
          : Row(
              children: [
                Sidebar(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [WelcomeBanner(), TimerContainer()],
                  ),
                ),
              ],
            ),
    );
  }
}
