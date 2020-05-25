import 'package:car_details_app/models/car_model.dart';
import 'package:car_details_app/screens/car_details_screen.dart';
import 'package:car_details_app/widgets/fav_icon.dart';
import 'package:flutter/material.dart';

class CarList extends StatefulWidget {
  @override
  _CarListState createState() => _CarListState();
}

class _CarListState extends State<CarList> {
  @override
  Widget build(BuildContext context) {
    if (cars.length > 0) {
      cars.sort((a, b) => a.compareTo(b));
      return Container(
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
        child: ListView.builder(
          itemCount: cars.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CarDetails(index)));
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 20.0,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blueGrey[200],
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                cars[index].make + ' ' + cars[index].model,
                                style: TextStyle(
                                  color: Colors.deepPurple[800],
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.2,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              cars[index].numberplate.toUpperCase(),
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 6.0,
                              ),
                            ),
                            SizedBox(height: 20.0),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FavIcon(currentIndex: index, notifyParent: refresh),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              'No Cars Imported',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.4,
              ),
            ),
          ),
          Icon(Icons.directions_car, size: 128.0, color: Colors.grey,),
        ],
      );
    }
  }

  refresh() {
    setState(() {});
  }
}
