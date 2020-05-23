import 'package:car_details_app/screens/servicedetail_screen.dart';
import 'package:car_details_app/models/service_model.dart';
import 'package:car_details_app/screens/car_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_details_app/widgets/services.dart';
import 'package:car_details_app/widgets/firebase_auth.dart';
import 'package:car_details_app/screens/login_page.dart';
import 'package:car_details_app/screens/home_screen.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ServicesScreenState();
  }
}

class ServicesScreenState extends State<ServicesScreen> {
  @override Widget build(BuildContext context) {
    return new Scaffold(
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
                Icons.arrow_left,
                    () => {
                  AuthProvider().logOut(),
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginOptions()))
                },
              ),
            ],
          )),
      appBar: new AppBar(
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
          'Nearby Services',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 50.0,
        centerTitle: true,
      ),
      body: _createContent(),
    );
  }

  Widget _createContent() {
    if (_services == null) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    }
    else {
      return new ListView(
        children: _services.map((f) {
          return new Card(child:
              new ListTile(
            title: new Text(f.name),
            subtitle: new Text(f.vicinity),
            trailing: new Column(
              children: <Widget>[
                new Icon(Icons.star_border, color: Colors.yellow,),
                new Text(f.rating)
              ],
            ),
                onTap: (){handleTap(f);},
          ));
        }).toList(),
      );
    }
  }

  handleTap(Service service){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new ServiceDetailScreen(service)));
  }

  List<Service> _services;

  @override void initState() {
    super.initState();
    Services.get().getNearbyServices().then((data) {
      this.setState(() {
        _services = data.cast<Service>();
      });
    });
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