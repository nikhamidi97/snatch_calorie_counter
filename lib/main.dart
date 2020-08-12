import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snatch_calorie_counter/models/user.dart';
import 'package:snatch_calorie_counter/screens/starting/splash.dart';
import 'package:snatch_calorie_counter/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          canvasColor: Colors.white,
        ),
        home: Splash(),
      ),
    );
  }
}
