import 'package:car_details_app/service_model.dart';
import 'package:car_details_app/servicedetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_details_app/services.dart';

class ServicesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ServicesScreenState();
  }
}

class ServicesScreenState extends State<ServicesScreen> {
  @override Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Nearby Services"),
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
        _services = data;
      });
    });
  }
}