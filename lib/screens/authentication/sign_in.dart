import 'package:flutter/material.dart';
import 'package:snatch_calorie_counter/shared/constants.dart';
import 'package:snatch_calorie_counter/services/auth.dart';
import 'package:snatch_calorie_counter/shared/loading.dart';

class Signin extends StatefulWidget {
  final Function toggleView;
  Signin({this.toggleView});

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('lib/assets/loginPage.jpg'),
          fit: BoxFit.cover,
        )),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(
                  hintText: 'Email',
                ),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6
                    ? 'The length of password is atleat 6'
                    : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              loading
                  ? Loading()
                  : RaisedButton(
                      color: Colors.red,
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .signInWithEmailAndPassword(email, password);

                          if (result == null) {
                            setState(() {
                              error = 'Invalid email or password';
                              loading = false;
                            });
                          }
                        }
                      }),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              ),
              FlatButton(
                child: Text(
                  'Create new account',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  widget.toggleView();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
