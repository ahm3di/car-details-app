import 'car_model.dart';

class Event{
  String dateTime;
  String eventType;
  Car car;

  Event(this.dateTime,this.car,this.eventType);
}