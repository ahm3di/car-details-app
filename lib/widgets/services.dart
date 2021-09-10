import '../models/service_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:geolocator/geolocator.dart';

class Services {
  static final _service = new Services();
  static String placesAPIkey = "AIzaSyAJkeLCe0QUS2I1ZDSayaFCFLm8rcwacSA";

  static Services get() {
    return _service;
  }

  Future<Position> getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }

  final String searchUrl =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?radius=5000&type=car_repair&key=" +
          placesAPIkey +
          "&location=";

  Future<List<Service>> getNearbyServices() async {
    var coords = await getCurrentLocation();
    var lat = coords.latitude.toString();
    var lng = coords.longitude.toString();

    var response = await http.get(searchUrl + lat + "," + lng,
        headers: {"Accept": "application/json"});
    var services = <Service>[];

    List data = json.decode(response.body)["results"];

    data.forEach((f) => services.add(new Service(
        f["name"], f["rating"].toString(), f["vicinity"], f["place_id"])));
    return services;
  }

  final String detailUrl =
      "https://maps.googleapis.com/maps/api/place/details/json?key=" +
          placesAPIkey +
          "&place_id=";

  Future getService(Service service) async {
    var response = await http
        .get(detailUrl + service.id, headers: {"Accept": "application/json"});
    var result = json.decode(response.body)["result"];

    var weekdays =
        new List<String>.from(result["opening_hours"]["weekday_text"]);

    service.weekdayText = weekdays;
    service.formattedAddress = result["formatted_address"];
    service.internationalPhoneNumber = result["international_phone_number"];
    service.lat = result["geometry"]["location"]["lat"];
    service.lng = result["geometry"]["location"]["lng"];
    service.website = result["website"];

    List<String> temp = List<String>();
    for (int i = 0; i < 5; i++) {
      temp.add(result["reviews"][i]["author_name"]);
      temp.add(result["reviews"][i]["rating"].toString());
      temp.add(result["reviews"][i]["text"]);
    }
    service.review = temp;

    return service;
  }
}
