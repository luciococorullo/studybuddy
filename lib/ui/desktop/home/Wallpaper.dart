import 'package:flutter/material.dart';

//flutter run -d chrome --web-render html
class Wallpaper extends StatelessWidget {
  String src =
      "https://images.unsplash.com/photo-1542261777448-23d2a287091c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80";
  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.cover,
    );
  }
}
