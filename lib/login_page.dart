import 'package:car_details_app/email_login.dart';
import 'package:car_details_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:car_details_app/firebase_auth.dart';

class LoginOptions extends StatefulWidget {
  @override
  _LoginOptionsState createState() => _LoginOptionsState();
}

class _LoginOptionsState extends State<LoginOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 100.0),
              Text("Welcome", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
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
