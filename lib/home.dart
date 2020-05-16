import 'package:car_details_app/firebase_auth.dart';
import 'package:car_details_app/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page")
      ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Content to be added"),
              RaisedButton(
                child: Text("Log out"),
                onPressed: (){
                  AuthProvider().logOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginOptions()));
                },
              )
            ],
          )
        )
    );
  }
}
