import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snatch_calorie_counter/models/food_card.dart';
import 'package:snatch_calorie_counter/models/food.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserData>>(context);

    return Container(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            for (int i = 0; i < users.length; i++) FoodCard(userData: users[i]),
            Container(
              height: 600,
              color: Color(0xFFDFE6E9),
            ),
          ],
        ),
      ),
    );
  }
}
