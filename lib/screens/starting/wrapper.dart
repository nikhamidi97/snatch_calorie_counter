import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snatch_calorie_counter/models/user.dart';
import 'package:snatch_calorie_counter/screens/authentication/authentication.dart';
import 'package:snatch_calorie_counter/screens/starting/screenWrapper.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authentication();
    } else {
      return ScreenWrapper();
    }
  }
}
