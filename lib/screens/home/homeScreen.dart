import 'package:flutter/material.dart';
import 'package:snatch_calorie_counter/models/food.dart';
import 'package:snatch_calorie_counter/screens/home/RadialProgress.dart';
import 'package:snatch_calorie_counter/screens/profile/profilePage.dart';
import 'package:snatch_calorie_counter/screens/starting/screenWrapper.dart';
import 'package:snatch_calorie_counter/services/database.dart';
import 'package:provider/provider.dart';
import 'package:snatch_calorie_counter/screens/home/userList.dart';

class HomeScreen extends StatelessWidget {
  final UserData userData = UserData();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return StreamProvider<List<UserData>>.value(
      value: DatabaseService().users,
      child: Scaffold(
        backgroundColor: Color(0xFFE9E9E9),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              height: height * 0.44,
              left: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: const Radius.circular(40),
                  top: const Radius.circular(40),
                ),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 5, left: 25, right: 15, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "20 September, 2020",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                        subtitle: Text(
                          "Hello, hamidi",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 23,
                            color: Colors.black,
                          ),
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            ScreenWrapper();
                          },
                          child: ClipOval(
                            child: Image.asset(
                              "lib/assets/userImage.jpg",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RadialProgress(40)
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: height * 0.47,
              left: 0,
              right: 0,
              child: Container(
                height: height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 8,
                        left: 25,
                      ),
                      child: Text(
                        "Meals for today",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: UserList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
