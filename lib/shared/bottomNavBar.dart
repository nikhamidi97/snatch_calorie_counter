import 'package:flutter/material.dart';

class BottomNavbar extends BottomNavigationBar {
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        SizedBox(width: 40),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
