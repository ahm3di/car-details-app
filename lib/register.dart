import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:car_details_app/firebase_auth.dart';
import 'package:car_details_app/main.dart';

class RegisterEmail extends StatefulWidget {
  @override
  _RegisterEmailState createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 100.0),
                  Text("Register",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
                  SizedBox(height: 20.0),
                  TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Enter email")),
                  SizedBox(height: 10.0),
                  TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Enter password")),
                  SizedBox(height: 10.0),
                  new Row(children: <Widget>[
                    RaisedButton(
                      child: Text("Register"),
                      onPressed: () async{

                        bool result = await AuthProvider().signUpWithEmailAndPassword(
                            _emailController.text.trim(), _passwordController.text.trim());

                        if (result)
                          print("User registered");
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => MainScreen()  ));
                        print("Error while registering user");

                      },
                    )
                  ])
                ],
              ),
            )));
  }
}
