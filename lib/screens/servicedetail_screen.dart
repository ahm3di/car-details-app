import 'package:flutter/material.dart';
import '../models/service_model.dart';
import '../widgets/services.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ServiceDetailScreen extends StatefulWidget {
  Service _service;

  ServiceDetailScreen(this._service);

  @override
  State<StatefulWidget> createState() {
    return new ServiceDetailScreenState();
  }
}

class ServiceDetailScreenState extends State<ServiceDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget._service.name),
      ),
      body: _createContent(),
    );
  }

  Widget _createContent() {
    if (_isLoading) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getCard(
              "Address", widget._service.formattedAddress, Icons.location_on),
          getCard("Working hours", widget._service.weekdayText.join("\n"),
              Icons.work),
          Container(
              child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      reviews(widget._service.review[0], widget._service.review[1], widget._service.review[2]),
                      reviews(widget._service.review[3], widget._service.review[4], widget._service.review[5]),
                      reviews(widget._service.review[6], widget._service.review[7], widget._service.review[8]),
                      reviews(widget._service.review[9], widget._service.review[10], widget._service.review[11]),
                      reviews(widget._service.review[12], widget._service.review[13], widget._service.review[14]),

            ],
          ))),
          RaisedButton(
            child: Text("Get Directions"),
            color: Colors.red,
            textColor: Colors.white,
            highlightColor: Colors.black,
            onPressed: () => MapsLauncher.launchCoordinates(
                widget._service.lat, widget._service.lng),
          )
        ],
      );
    }
  }

  Container reviews(String customerName, String rating, String comment) {
    return Container(
      width: 350,
      child: Card(
          child: Wrap(
        children: <Widget>[
          ListTile(
              title: new Text(customerName, style: new TextStyle(fontWeight: FontWeight.bold),),
              subtitle: new AutoSizeText(comment,maxLines: 24,),
              trailing: new Column(
                children: <Widget>[
                  new Icon(
                    Icons.star_border,
                    color: Colors.yellow,
                  ),
                  new Text(rating)
                ],
              ))
        ],
      )),
    );
  }

  Widget getCard(String header, String data, IconData iconData) {
    return new Card(
        color: Colors.white,
        child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Text(header,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    new Icon(
                      iconData,
                      color: Colors.blue,
                    )
                  ],
                ),
                new Padding(
                    padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                    child: new Text(data,
                        textAlign: TextAlign.start,
                        style: new TextStyle(
                          fontSize: 16.0,
                        ))),
              ],
            )));
  }

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Services.get().getService(widget._service).then((data) {
      this.setState(() {
        widget._service = data;
        print(data);
        _isLoading = false;
      });
    });
  }
}
