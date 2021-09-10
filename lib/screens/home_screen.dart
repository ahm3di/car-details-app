import 'package:car_details_app/models/car_model.dart';
import 'package:car_details_app/screens/services_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:car_details_app/screens/login_page.dart';
import 'package:car_details_app/screens/car_screen.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:url_launcher/url_launcher.dart';
import 'car_details_screen.dart';
import 'package:intl/intl.dart';
import 'package:car_details_app/models/events_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<DateTime, Event> map = {};
  List orderedDates = [];
  var sortedMap;

  @override
  void initState() {
    sortUpcomingEvents();
    super.initState();
  }

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
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Material(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)),
                    elevation: 20,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/images/logo.png',
                        width: 120,
                        height: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CustomListTile(
            Icons.home,
            'Home',
            Icons.arrow_right,
            () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()))
            },
          ),
          CustomListTile(
            Icons.directions_car,
            'Car Details',
            Icons.arrow_right,
            () => {
              Navigator.of(context).pop(),
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => CarDetailsScreen()))
            },
          ),
          CustomListTile(
            Icons.pin_drop,
            'Nearby Services',
            Icons.arrow_right,
            () => {
              Navigator.of(context).pop(),
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
          'Home',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 50.0,
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
            new Expanded(
              child: new Container(
                child: new Carousel(
                  boxFit: BoxFit.fill,
                  images: [
                    AssetImage("assets/images/home1.png"),
                    AssetImage("assets/images/home2.png"),
                    AssetImage("assets/images/home3.png"),
                  ],
                  autoplay: true,
                  autoplayDuration: new Duration(seconds: 5),
                  indicatorBgPadding: 1.0,
                  //dotColor: Colors.red,
                  dotSize: 4.0,
                ),
              ),
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                  height: 100.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 15.0,
                  ),
                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        height: 160.0,
                        width: 300,
                        margin: new EdgeInsets.only(
                          left: 60,
                        ),
                        decoration: new BoxDecoration(
                          color: new Color(0xFF333366),
                          shape: BoxShape.rectangle,
                          borderRadius: new BorderRadius.circular(10.0),
                          boxShadow: <BoxShadow>[
                            new BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 7.0,
                              offset: new Offset(0.0, 10.0),
                            ),
                          ],
                        ),
                      ),
                      new Container(
                        margin: new EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 3.0,
                        ),
                        alignment: FractionalOffset.centerLeft,
                        child: new Image(
                          image: new AssetImage("assets/images/car.png"),
                          height: 170,
                          width: 170,
                        ),
                      ),
                      new Container(
                        padding: const EdgeInsets.only(top: 16.0, left: 140.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              new Text(
                                "Useful Links:",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              new InkWell(
                                  child: new Text(
                                      'AA National Breakdown Recovery',
                                      style: TextStyle(
                                          color: Colors.lightBlue[200],
                                          decoration:
                                              TextDecoration.underline)),
                                  onTap: () => launch(
                                      'https://www.theaa.com/breakdown-cover/national-recovery')),
                              SizedBox(height: 10.0),
                              new InkWell(
                                  child: new Text('IAM RoadSmart (Information)',
                                      style: TextStyle(
                                          color: Colors.lightBlue[200],
                                          decoration:
                                              TextDecoration.underline)),
                                  onTap: () =>
                                      launch('https://www.iamroadsmart.com/')),
                              SizedBox(height: 10.0),
                              new InkWell(
                                  child: new Text('Department For Transport',
                                      style: TextStyle(
                                          color: Colors.lightBlue[200],
                                          decoration:
                                              TextDecoration.underline)),
                                  onTap: () => launch(
                                      'https://www.gov.uk/government/organisations/department-for-transport')),
                              SizedBox(height: 10.0),
                              new InkWell(
                                  child: new Text('Brake (Road Safety)',
                                      style: TextStyle(
                                        color: Colors.lightBlue[200],
                                        decoration: TextDecoration.underline,
                                      )),
                                  onTap: () =>
                                      launch('http://www.brake.org.uk/')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Upcoming Events",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
                  ),
                ],
              ),
            ),
            Container(
                child: Expanded(
                    child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  for (int i = 0; i < map.length; i++) upcomingEvents(i)
                ],
              ),
            )))
          ],
        ),
      ),
    );
  }

  getIntMonth(String s) {
    int month;
    switch (s.toLowerCase()) {
      case 'januray':
        month = 1;
        break;
      case 'february':
        month = 2;
        break;
      case 'march':
        month = 3;
        break;
      case 'april':
        month = 4;
        break;
      case 'may':
        month = 5;
        break;
      case 'june':
        month = 6;
        break;
      case 'july':
        month = 7;
        break;
      case 'august':
        month = 8;
        break;
      case 'september':
        month = 9;
        break;
      case 'october':
        month = 10;
        break;
      case 'november':
        month = 11;
        break;
      case 'december':
        month = 12;
        break;
    }
    return month;
  }

  sortUpcomingEvents() {
    DateFormat format = DateFormat("dd-MM-yyyy");
    if (cars.isNotEmpty) {
      for (int i = 0; i < cars.length; i++) {
        List<String> mot = cars[i].motDetails.split(' ');
        String motDate =
            (mot[0] + "-" + getIntMonth(mot[1]).toString() + "-" + mot[2]);
        map[format.parse(motDate)] = Event(cars[i].motDetails, cars[i], 'MOT');

        List<String> tax = cars[i].taxDetails.split(' ');
        String taxDate =
            (tax[0] + "-" + getIntMonth(tax[1]).toString() + "-" + tax[2]);
        map[format.parse(taxDate)] = Event(cars[i].taxDetails, cars[i], 'Tax');

        if (cars[i].insuranceDetails != null) {
          List<String> insurance = cars[i].insuranceDetails.split(' ');
          String insuranceDate = (insurance[0] +
              "-" +
              getIntMonth(insurance[1]).toString() +
              "-" +
              insurance[2]);
          map[format.parse(insuranceDate)] =
              Event(cars[i].insuranceDetails, cars[i], 'Insurance');
        }
      }
    }
    sortedMap = Map.fromEntries(
        map.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
    orderedDates = sortedMap.keys.toList();
  }

  void _showDialog(String title, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(
            "App Information",
            textAlign: TextAlign.center,
          ),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text('Version: 1.0.0',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  SizedBox(height: 30.0),
                  Text(
                      'This app was created in fulfilment of the coursework assessment for module CN6211',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueGrey)),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                            "•	 Useful links regarding roadsafe can be found on the ‘Home’ page of this app along with a list of upcoming events (i.e. MOT) ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.cyan[800], wordSpacing: 5)),
                        SizedBox(height: 30.0),
                        Text(
                            "•	 Details about your vehicle (such as reg, etc.) can be viewed and added on the ‘Car Details’ page",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.cyan[800], wordSpacing: 5)),
                        SizedBox(height: 30.0),
                        Text(
                            "•	 In an emergency local car services within your surrounded area can be found by searching for the required service through the ‘Nearby Services’ page ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.cyan[800], wordSpacing: 5)),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text("CN6211",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        Text("Mobile App Development",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        Text("Ahmed, Talia, Chris & Keerthy (2020)",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
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

  String numberPlate(int i) {
    Event e = sortedMap[orderedDates[i]];
    return e.car.numberplate;
  }

  String getDueDate(int i) {
    Event e = sortedMap[orderedDates[i]];
    return e.dateTime;
  }

  String getEventType(int i) {
    Event e = sortedMap[orderedDates[i]];
    return e.eventType;
  }

  Car getCar(int i) {
    Event e = sortedMap[orderedDates[i]];
    return e.car;
  }

  Container upcomingEvents(int num) {
    return Container(
      height: 140,
      child: Wrap(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CarDetails(cars.indexOf(getCar(num))))),
                child: Container(
                  padding: EdgeInsets.all(10.0),
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
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(7.0)),
                  ),
                  child: Text(
                    numberPlate(num),
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'UKNumberPlate',
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Text(
                  getEventType(num),
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CarDetails(cars.indexOf(getCar(num))))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Text(
                  "Date: " + getDueDate(num),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CarDetails(cars.indexOf(getCar(num))))),
              ),
            ],
          ),
        ],
      ),
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
