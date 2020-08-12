import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 50.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Center(
          child: SpinKitWave(
            color: Colors.red,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}
