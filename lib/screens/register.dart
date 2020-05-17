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
        body: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Register",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0,letterSpacing: 2.0)),
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
                    RaisedButton(
                      color:Colors.blue,
                      child: Text("Register"),
                      onPressed: () async{
                        bool result = await AuthProvider().signUpWithEmailAndPassword(
                            _emailController.text.trim(), _passwordController.text.trim());
                        if (result) {
                          print("User registered");
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailLogin()));
                          _showDialog("Email registered", "Please check your inbox for a verification email");
                        }else {
                          if(_emailController.text.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text))
                            _showDialog("Error", "Please fill in the email and password fields correctly");

                          else if(_passwordController.text.trim().length < 6)
                            _showDialog("Error", "Length of password must be greater than 6");

                          else {
                            _showDialog("Error", "You have already registerd, please verify your email to login");
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailLogin()));
                          }
                        }
                      },
                    ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EmailLogin()));
                      },
                    child: new Text("Already have an account?"),
                  )
                ],
              ),
            ));
  }
  void _showDialog(String title,String text) {
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
