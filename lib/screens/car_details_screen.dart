import 'dart:ui';
import 'package:car_details_app/screens/car_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_details_app/models/car_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CarDetails extends StatefulWidget {
  final int ind;

  CarDetails(this.ind);

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.keyboard_backspace),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Details',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {
              _showConfirmation();
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width * 0.25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: new BoxDecoration(
                  color: Color(0xffffc40d),
                  gradient: new LinearGradient(
                    colors: [Color(0xffffc40d), Color(0xffffde78 /*ffca26*/)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  border: new Border.all(
                    color: Colors.black,
                    width: 3.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(7.0)),
                ),
                child: Text(
                  cars[widget.ind].numberplate,
                  style: TextStyle(
                    fontSize: 40.0,
                    fontFamily: 'UKNumberPlate',
                    letterSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.20),
          Padding(
            padding: EdgeInsets.only(
                left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.clock,
                      size: 26,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 7.0),
                      child: Text(
                        'Manufactured',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Text(
                      capitalize(cars[widget.ind].yearOfManufacture),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.cog,
                      size: 26,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 7.0),
                      child: Text(
                        'Transmission',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    Text(
                      capitalize(cars[widget.ind].transmission),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FaIcon(
                      FontAwesomeIcons.gasPump,
                      size: 26,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 7.0),
                      child: Text(
                        'Fuel Type',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                    //SizedBox(height: 10.0),
                    Text(
                      capitalize(cars[widget.ind].fuelType),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * 0.15),
          Padding(
            padding: EdgeInsets.only(
                left: 50.0, right: 50.0, top: 30.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'MOT:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _getMOT(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 50.0, right: 50.0, top: 30.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Insurance:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                cars[widget.ind].insured == null ||
                        cars[widget.ind].insured == false
                    ? GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 3),
                            lastDate: DateTime(DateTime.now().year + 3),
                          ).then((date) {
                            if (date != null) {
                              cars[widget.ind].setInsurance(date);
                            }
                            setState(() {});
                          });
                        },
                        child: Text(
                          cars[widget.ind].insured == null
                              ? 'Click to set insurance'
                              : 'Expired! Enter new expiry',
                          style: TextStyle(
                            color: cars[widget.ind].insured == null
                                ? Colors.blue[600]
                                : Colors.red[600],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    : _getInsurance(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 50.0, right: 50.0, top: 30.0, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Tax:',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                _getTAX(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String capitalize(String s) {
    s = s.toLowerCase();
    return s[0].toUpperCase() + s.substring(1);
  }

  Text _getTAX() {
    return Text(
      cars[widget.ind].taxed
          ? 'Expires ' + cars[widget.ind].taxDetails
          : 'Expired!',
      style: TextStyle(
        color: cars[widget.ind].taxed ? Colors.black : Colors.red[600],
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _getMOT() {
    return Text(
      cars[widget.ind].mot
          ? 'Expires ' + cars[widget.ind].motDetails
          : 'Expired!',
      style: TextStyle(
        color: cars[widget.ind].mot ? Colors.black : Colors.red[600],
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _getInsurance() {
    return Text(
      cars[widget.ind].insured
          ? 'Expires ' + cars[widget.ind].insuranceDetails
          : 'Expired!',
      style: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  void _showConfirmation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Delete Car Record?'),
          content: new Text(
              'This will permenantly remove this car from the app. Do you want to proceed?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Yes', style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                cars.removeAt(widget.ind);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => CarDetailsScreen()),
                  (Route<dynamic> route) => false,
                );
                /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CarDetailsScreen()));*/
              },
            ),
            new FlatButton(
              child: new Text('No', style: TextStyle(fontSize: 18.0)),
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
