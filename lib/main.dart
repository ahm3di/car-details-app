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
