
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30.0),
                TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText:"Enter email"
                    )

                )
              ],
            )
        )
    );
  }
}
