
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState(){
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
                  Text("Login", style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                  )),
                  SizedBox(height: 20.0),
                  TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText:"Enter email"
                      )
                  ),
                  SizedBox(height:10.0),
                  TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText:"Enter password"
                      )
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: (){
                      print("Login Button Pressed");
                    },
                  )

                ],
              ),
            )
        )
    );
  }
}
