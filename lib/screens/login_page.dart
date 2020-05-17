import 'dart:ui';
import 'package:car_details_app/screens/email_login.dart';
import 'package:car_details_app/screens/car_screen.dart';
import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginOptions extends StatefulWidget {
  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Welcome", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50.0,
                  letterSpacing: 2,
                  color: Colors.black
              )),
              SizedBox(height: 20.0),
              SignInButton(
                Buttons.Email,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EmailLogin()));
                },
              ),
              SignInButton(
                Buttons.GoogleDark,
                onPressed: () async {
                  bool result = await  AuthProvider().loginWithGoogle();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CarDetailsScreen()));
                  if(!result)
                    print("Error logging in with google");
                },
              ),
            ],
          ),
        )
    );
  }
}
