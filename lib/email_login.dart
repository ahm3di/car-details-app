import 'package:car_details_app/firebase_auth.dart';
import 'package:car_details_app/home.dart';
import 'package:car_details_app/register.dart';
import 'package:flutter/material.dart';

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
        body: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 100.0),
          Text("Login",
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
              child: Text("Login"),
              onPressed: () async {
                if (_emailController.text.isEmpty ||
                    _passwordController.text.isEmpty) {
                  print("Email and password is empty");
                  return;
                }
                bool result = await AuthProvider().signInWithEmail(
                    _emailController.text.trim(), _passwordController.text.trim());
                if (result){
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()  ));}
                else{
                  print("Problem signing in, please make sure your email is verified!");
                }
              },
            ),
            SizedBox(width: 10.0,),
            RaisedButton(
              child: Text("Register"),
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => RegisterEmail()  ));
              },
            )
          ])
        ],
      ),
    )));
  }
}
