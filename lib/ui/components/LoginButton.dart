import 'package:flutter/material.dart';
import 'package:studybuddy/models/auth.dart';
import 'package:studybuddy/ui/pages/AuthDialog.dart';

//TODO: da cancellare
class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List _isHovering = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false
    ];
    return Container(
      //margin: EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: userEmail == null
            ? () {
                showDialog(
                  context: context,
                  builder: (context) => AuthDialog(),
                );
              }
            : null,
        child: userEmail == null
            ? Text(
                'Sign in',
                style: TextStyle(
                  color: _isHovering[3] ? Colors.white : Colors.white70,
                ),
              )
            : Row(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundImage:
                        imageUrl != null ? NetworkImage(imageUrl) : null,
                    child: imageUrl == null
                        ? Icon(Icons.account_circle, size: 30)
                        : Container(),
                  ),
                  Text(
                    name ?? userEmail,
                    style: TextStyle(
                      color: _isHovering[3] ? Colors.white : Colors.white70,
                    ),
                  ),
                  TextButton(
                    // ...
                    onPressed: () {},
                    child: Text(
                      'Sign out',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
