import 'package:flutter/material.dart';
import 'package:custom_navigator/custom_scaffold.dart';
import 'package:snatch_calorie_counter/screens/home/homeScreen.dart';
import 'package:snatch_calorie_counter/screens/profile/profilePage.dart';

class ScreenWrapper extends StatefulWidget {
  @override
  _ScreenWrapperState createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      scaffold: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                "lib/assets/Logo.png",
                height: 24,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Snatch',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'MountainBridge',
                    fontSize: 15),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new FloatingActionButton(
            splashColor: Colors.red[100],
            backgroundColor: Colors.red,
            child: Icon(
              Icons.add_a_photo,
            ),
            onPressed: () {}),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 2,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: _items,
        ),
      ),
      children: <Widget>[
        HomeScreen(),
        ProfileScreen(),
      ],
      onItemTap: (index) {},
    );
  }

  final _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('home'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      title: Text('profile'),
    ),
  ];
}
