import 'dart:convert';
import 'package:car_details_app/models/car_model.dart';
import 'package:car_details_app/screens/services_screen.dart';
import 'package:car_details_app/widgets//car_list.dart';
import 'package:car_details_app/widgets/database.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:http/http.dart' as http;
import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:car_details_app/screens/login_page.dart';
import 'package:car_details_app/screens/home_screen.dart';

class CarDetailsScreen extends StatefulWidget {
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child: Column(
                    children: <Widget>[Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation:20,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset('assets/images/logo.png', width:120, height: 100,),
                      ),
                    ),],
                  ),
                ),
              ),
              CustomListTile(
                Icons.home,
                'Home',
                Icons.arrow_right,
                    () => {Navigator.of(context).pop(),
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()))
                },
              ),
              CustomListTile(
                Icons.directions_car,
                'Car Details',
                Icons.arrow_right,
                    () => {Navigator.of(context).pop(),
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => CarDetailsScreen()))
                },
              ),
              CustomListTile(
                Icons.pin_drop,
                'Nearby Services',
                Icons.arrow_right,
                    () => {Navigator.of(context).pop(),
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ServicesScreen()))
                },
              ),
              CustomListTile(
                Icons.info_outline,
                'About',
                Icons.arrow_right,
                    () => {
                  _showDialog("About", ""),
                },
              ),
              CustomListTile(
                Icons.exit_to_app,
                'Logout',
                Icons.arrow_right,
                    () => {
                  AuthProvider().logOut(),
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginOptions()))
                },
              ),
            ],
          )),
      appBar: AppBar(
        flexibleSpace: Container(
          padding: EdgeInsets.all(100.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              colors: [
                const Color(0xFF3366FF),
                const Color(0xFF00CCFF),
              ],
            ),
          ),
        ),
        title: Text(
          'Cars',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 50.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () async {
              try {
                await _asyncAddDialog(context);

              } catch (err) {
                DropdownBanner.showBanner(
                  text: 'An Error Has Occured.',
                  color: Colors.red[600],
                  textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
                );
              }
            },
          ),
        ],
        centerTitle: true,
      ),
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
        child: Column(
          children: <Widget>[
            Expanded(
              child: CarList(),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _fetchCarDetails(String plate) async {
    try {
      final response = await http.get(
          "https://dvlasearch.appspot.com/DvlaSearch?apikey=DvlaSearchDemoAccount&licencePlate=" +
              plate);
      if (response.statusCode == 200) {
        Car c = Car.fromJson(json.decode(response.body), plate);
        if (c.numberplate != null) {
          cars.add(c);
          await DatabaseService(uid: AuthProvider.userID).updateUserData(c.numberplate,c.make,c.model,c.yearOfManufacture,c.transmission,c.fuelType,
              c.mot,c.taxed,c.insured,c.motDetails,c.taxDetails,c.insuranceDetails,c.isFavourite);
          setState(() {});
          return true;
        } else {
          return false;
        }
      } else {
        DropdownBanner.showBanner(
          text: 'Failed To Load.',
          color: Colors.red[600],
          textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
        );
        return false;
      }
    } catch (err) {
      DropdownBanner.showBanner(
        text: 'An Error Has Occured.',
        color: Colors.red[600],
        textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
      );
      return false;
    }
  }

  _asyncAddDialog(BuildContext context) async {
    String motInput = '';
    RegExp regExp = new RegExp(r'^[A-Za-z]{2}[0-9]{2}\s?[A-Za-z]{3}$');
    return showDialog<String>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Car Registration', textAlign: TextAlign.center),
          content: new Row(
            children: <Widget>[
              new Expanded(
                child: new TextField(
                  autofocus: true,
                  decoration: new InputDecoration(
                    labelText: 'Enter Reg. No.',
                    labelStyle: TextStyle(fontSize: 20.0),
                    hintText: 'e.g. MT09NKS',
                  ),
                  onChanged: (value) {
                    motInput = value;
                  },
                ),
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Search', style: TextStyle(fontSize: 18.0)),
              onPressed: () async {
                FocusScope.of(context).unfocus();
                if (regExp.hasMatch(motInput)) {
                  DropdownBanner.showBanner(
                    text: 'Searching...',
                    color: Colors.deepPurple[800],
                    textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
                  );
                  if (await _fetchCarDetails(motInput)) {
                    Navigator.of(context).pop();
                  } else {
                    DropdownBanner.showBanner(
                      text: 'Could Not Find Vehicle.',
                      color: Colors.red[600],
                      textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
                    );
                  }
                } else {
                  DropdownBanner.showBanner(
                    text: 'Invalid Registration Number',
                    color: Colors.red[600],
                    textStyle: TextStyle(color: Colors.white, fontSize: 28.0),
                  );
                }
              },
            ),
            FlatButton(
              child: Text('Cancel', style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("App Information",textAlign: TextAlign.center,),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                      'Version: 1.0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 30.0),
                  Text(
                      'This app was created in fulfilment of the coursework assessment for module CN6211', textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey)),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("•	 Useful links regarding roadsafe can be found on the ‘Home’ page of this app along with a list of upcoming events (i.e. MOT) ",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.cyan[800], wordSpacing: 5)),
                        SizedBox(height: 30.0),
                        Text(
                            "•	 Details about your vehicle (such as reg, etc.) can be viewed and added on the ‘Car Details’ page",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.cyan[800], wordSpacing: 5)),
                        SizedBox(height: 30.0),
                        Text("•	 In an emergency local car services within your surrounded area can be found by searching for the required service through the ‘Nearby Services’ page ",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.cyan[800], wordSpacing: 5)),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("CN6211",
                            style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("Mobile App Development",
                            style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold, fontSize: 12)),
                        Text("Ahmed, Talia, Chris & Keerthy (2020)",
                            style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
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

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  IconData iconArrow;
  Function onTap;

  CustomListTile(this.icon, this.text, this.iconArrow, this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[400]))),
        child: InkWell(
          splashColor: Colors.blue[200],
          onTap: onTap,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(iconArrow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
