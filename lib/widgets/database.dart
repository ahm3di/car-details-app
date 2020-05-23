import 'package:car_details_app/models/car_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference carCollection =
      Firestore.instance.collection('users');

  Future updateUserData(
      String numberplate,
      String make,
      String model,
      String yearOfManufacture,
      String transmission,
      String fuelType,
      bool mot,
      bool taxed,
      bool insured,
      String motDetails,
      taxDetails,
      String insuranceDetails,
      bool isFavourite) async {
    return await carCollection
        .document(uid)
        .collection('carCollection')
        .document(numberplate)
        .setData({
      'numberplate': numberplate,
      'make': make,
      'model': model,
      'yearOfManufacture': yearOfManufacture,
      'transmission': transmission,
      'fuelType': fuelType,
      'mot': mot,
      'taxed': taxed,
      'insured': insured,
      'motDetails': motDetails,
      'taxDetails': taxDetails,
      'insuranceDetails': insuranceDetails,
      'isFavourite': isFavourite,
    });
  }

  getData() {
    cars = new List<Car>();
    carCollection
        .document(uid)
        .collection('carCollection')
        .getDocuments()
        .then((querySnapshot) {
      querySnapshot.documents.forEach((result) {
        print("eachRESULT");
        Map<String, dynamic> l = (result.data);
        Car c = new Car(
            numberplate: l['numberplate'],
            make: l['make'],
            model: l['model'],
            yearOfManufacture: l['yearOfManufacture'],
            transmission: l['transmission'],
            fuelType: l['fuelType'],
            mot: l['mot'],
            taxed: l['taxed'],
            insured: l['insured'],
            motDetails: l['motDetails'],
            taxDetails: l['taxDetails'],
            insuranceDetails: l['insuranceDetails'],
            isFavourite: l['isFavourite']);

        cars.add(c);
      });
    });
  }
}
