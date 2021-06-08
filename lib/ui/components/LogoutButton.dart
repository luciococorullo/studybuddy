import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/ui/pages/Homepage.dart';

class LogoutButton extends StatefulWidget {
  @override
  _LogoutButtonState createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  bool _isProcessing = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      child: userEmail != null
          ? TextButton(
              child: Text("Logout",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(color: Colors.white, fontSize: 18))),
              onPressed: _isProcessing
                  ? null
                  : () async {
                      setState(() {
                        _isProcessing = true;
                      });
                      await signOut().then((result) {
                        print(result);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Homepage(),
                          ),
                        );
                      }).catchError((error) {
                        print('Sign Out Error: $error');
                      });
                      setState(() {
                        _isProcessing = false;
                      });
                    },
            )
          : Container(),
    );
  }
}
