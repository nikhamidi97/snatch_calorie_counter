import 'package:flutter/material.dart';
import 'package:snatch_calorie_counter/screens/authentication/authentication.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('IntroScreen'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
              child: Text('Skip'),
              onPressed: () {
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (context) => Authentication()));
              }),
        ),
      ),
    );
  }
}
