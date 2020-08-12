import 'package:flutter/material.dart';
import 'package:snatch_calorie_counter/services/auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('lib/assets/profilePage.jpg'),
                fit: BoxFit.cover,
              )),
            ),
          ),
          Positioned(
            top: height * 0.15,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  Material(
                    elevation: 20,
                    child: Container(
                      height: 400,
                      width: 300,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                          child: Text('Edit Profile'),
                          onPressed: () {
                            _auth.signOutUser();
                          }),
                      SizedBox(
                        width: 10,
                      ),
                      RaisedButton(
                          color: Colors.red[800],
                          child: Text(
                            'logout',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _auth.signOutUser();
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.05,
            left: 0,
            right: 0,
            child: Center(
              child: ClipOval(
                child: Material(
                  elevation: 20,
                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.black,
                    child: Image.asset(
                      "lib/assets/userImage.jpg",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
