import 'package:car_details_app/screens/email_login.dart';
import 'package:flutter/material.dart';
import 'package:car_details_app/widgets/firebase_auth.dart';

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
            child: Text(
              "Register",
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20.0),
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
          SizedBox(height: 30.0),
          RaisedButton(
            color: Colors.lightBlueAccent,
            child: Text("Sign Up"),
            onPressed: () async {
              bool result = await AuthProvider().signUpWithEmailAndPassword(
                  _emailController.text.trim(),
                  _passwordController.text.trim());
              if (result) {
                print("User registered");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => EmailLogin()));
                _showDialog("Email registered",
                    "Please check your inbox for a verification email");
              } else {
                if (_emailController.text.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(_emailController.text))
                  _showDialog("Error",
                      "Please fill in the email and password fields correctly");
                else if (_passwordController.text.trim().length < 6)
                  _showDialog(
                      "Error", "Length of password must be greater than 6");
                else {
                  _showDialog("Error",
                      "You have already registerd, please verify your email to login");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EmailLogin()));
                }
              }
            },
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => EmailLogin()));
            },
            child: new Text("Already have an account?"),
          )
        ],
      ),
    ));
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
