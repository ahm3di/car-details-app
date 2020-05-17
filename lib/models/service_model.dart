class Service{
  String name;
  String rating;
  String vicinity;
  String id;
  String internationalPhoneNumber;
  List<String> weekdayText;
  String formattedAddress;
  double lat;
  double lng;
  List<String> review;

  Service(this.name,this.rating,this.vicinity,this.id,[this.internationalPhoneNumber,this.weekdayText,this.formattedAddress,this.lat,this.lng]);
}