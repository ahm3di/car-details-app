import 'package:car_details_app/screens/login_page.dart';
import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DropdownBanner(
        child: LoginOptions(),
      ),
    );
  }
}

//class MainScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder(
//      stream: FirebaseAuth.instance.onAuthStateChanged,
//      builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
//        if(snapshot.connectionState == ConnectionState.waiting)
//          return SplashPage();
//        if(!snapshot.hasData || snapshot.hasData == null)
//          return LoginOptions();
//        return HomePage();
//      },
//    );
//  }
//}
