import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:studybuddy/shared/ResponsiveView.dart';
import 'package:studybuddy/shared/costants.dart';
import 'package:studybuddy/ui/components/Logo.dart';
import 'package:studybuddy/ui/pages/Homepage.dart';
import 'package:studybuddy/ui/pages/PhoneHomepage.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return ResponsiveWidget.isSmallScreen(context)
            ? PhoneHomepage()
            : Homepage();
      }),
    );
  }

  Widget _buildImage(String assetName, [double width = 400]) {
    return Image.asset('assets/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 18.0, color: Colors.black54, fontFamily: 'Montserrat');

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          fontFamily: 'Montserrat'),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      //pageColor: secondary,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: secondary,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Text(''),
          ),
        ),
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: primary),
          child: const Text(
            'Let\s go right away!',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
            title: "StudyBuddy",
            body: "Never lose focus with your personal study buddy.",
            image: _buildImage('img1.png'),
            decoration: pageDecoration),
        PageViewModel(
          title: "Backed By Science",
          body:
              "We use evidence-based methods to help boost productivity, such as the psychology of imitation to mindfulness practices led by in-house experts.",
          image: _buildImage('img2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pomodoro Technique",
          body:
              "The Pomodoro technique is a simple yet effective tool for focused work with planned breaks in between.\nSo, how does it work? Let’s break down a pomodoro interval step by step:\n\n- Choose your assignment or work to do\n- Set the timer to 25 minutes \n - Work until the timer rings \n - Take a five-minute break",
          image: _buildImage('img3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Study Streams",
          body:
              "The psychology of mimicry or mirroring makes it easier for us to do something if we are watching someone else do that thing.\nIn other words, watching others study, as you would you see in a library, makes it easier for you to work harder.",
          image: _buildImage('img4.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Accessible Community",
          body:
              "We are a productivity community designed by students for students.",
          image: _buildImage('img5.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text('Done',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xffc08497),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
