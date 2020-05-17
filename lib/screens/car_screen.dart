import 'dart:convert';
import 'package:car_details_app/models/car_model.dart';
import 'package:car_details_app/screens/services_screen.dart';
import 'package:car_details_app/widgets//car_list.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_banner/dropdown_banner.dart';
import 'package:http/http.dart' as http;
import 'car_details_screen.dart';
import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:car_details_app/screens/login_page.dart';

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
              child: Text('Car Details App Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Car Details"),
              trailing: Icon(Icons.arrow_forward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CarDetailsScreen()));
                }
            ),
            ListTile(
              title: Text("Nearby Services"),
              trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ServicesScreen()));
                }
            ),
            ListTile(
                trailing: Icon(Icons.arrow_back),
                title: Text("Logout"),
                onTap: (){
                  Navigator.of(context).pop();
                  AuthProvider().logOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginOptions()));
                }
            ),
          ],
        )
      ),
      appBar: AppBar(
        title: Text(
          'Cars',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: CarList(),
          ),
        ],
      ),
    );
  }

  Future<bool> _fetchCarDetails(String plate) async {
    try {
      final response = await http.get(
          "https://dvlasearch.appspot.com/DvlaSearch?apikey=DvlaSearchDemoAccount&licencePlate=" +
              plate);

      if (response.statusCode == 200) {
        Car test = Car.fromJson(json.decode(response.body), plate);
        if (test.numberplate != null) {
          cars.add(test);
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
          title: Text('Enter Reg. Number'),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CarDetails(cars.length - 1)));
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
}
