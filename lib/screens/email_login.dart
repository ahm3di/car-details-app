import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:car_details_app/screens/register.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class EmailLogin extends StatefulWidget {
  @override
  _EmailLoginState createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
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
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Colors.teal[200],
                  Colors.teal[100],
                  Colors.teal[50],
                  Colors.teal[50],
                  Colors.white
                ])),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  child: new Text(
                    "Sign In",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: "Enter email")),
                ),
                SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.only(left: 60, right: 60),
                  child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: "Enter password")),
                ),
                SizedBox(height: 15.0),
                RaisedButton(
                  color: Colors.tealAccent[700],
                  child: Text("Login"),
                  onPressed: () async {
                    bool result = await AuthProvider().signInWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim());
                    if (result) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      if (_emailController.text.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(_emailController.text))
                        _showDialog("Error",
                            "Please fill in the email and password fields correctly");
                      else if (_passwordController.text.trim().length < 6)
                        _showDialog("Error",
                            "Length of password must be greater than 6");
                      else
                        _showDialog("Error",
                            "Error signing in, please make sure you have registered and verified your email");
                    }
                  },
                ),
                SizedBox(height: 5.0),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text("Register"),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterEmail()));
                  },
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () async {
                    bool result = await AuthProvider()
                        .resetPassword(_emailController.text.trim());
                    if (result) {
                      _showDialog("Password Reset",
                          "Please check your email for a link to reset your password");
                    } else
                      _showDialog("Error",
                          "Please make sure you entered the correct email address");
                  },
                  child: new Text("Forgot password?"),
                )
              ],
            )));
  }

  void _showDialog(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(title),
          content: new Text(text),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
