class Car implements Comparable<Car> {
  final String numberplate;
  final String make;
  final String model;
  final String yearOfManufacture;
  final String transmission;
  final String fuelType;
  bool mot;
  bool taxed;
  bool insured;
  String motDetails;
  String taxDetails;
  String insuranceDetails;
  bool isFavourite;

  Car({
    this.numberplate,
    this.make,
    this.model,
    this.yearOfManufacture,
    this.transmission,
    this.fuelType,
    this.mot,
    this.taxed,
    this.insured,
    this.motDetails,
    this.taxDetails,
    this.insuranceDetails,
    this.isFavourite,
  });

  void setFavourite(bool isFav) {
    isFavourite = isFav;
  }

  void setInsurance(DateTime date) {
    String month;
    switch (date.month) {
      case 1:
        {
          month = 'JANUARY';
        }
        break;
      case 2:
        {
          month = 'FEBRUARY';
        }
        break;
      case 3:
        {
          month = 'MARCH';
        }
        break;
      case 4:
        {
          month = 'APRIL';
        }
        break;
      case 5:
        {
          month = 'MAY';
        }
        break;
      case 6:
        {
          month = 'JUNE';
        }
        break;
      case 7:
        {
          month = 'JULY';
        }
        break;
      case 8:
        {
          month = 'AUGUST';
        }
        break;
      case 9:
        {
          month = 'SEPTEMBER';
        }
        break;
      case 10:
        {
          month = 'OCTOBER';
        }
        break;
      case 11:
        {
          month = 'NOVEMBER';
        }
        break;
      case 12:
        {
          month = 'DECEMBER';
        }
        break;
      default:
        {
          month = null;
        }
        break;
    }

    if (date.isAfter(DateTime.now())) {
      insuranceDetails =
          date.day.toString() + ' ' + month + ' ' + date.year.toString();
      insured = true;
    } else {
      insured = false;
    }
  }

  factory Car.fromJson(Map<String, dynamic> json, String plate) {
    if (json['error'] != 0 && json['error'] != 1) {
      return Car(
        numberplate: plate,
        make: json['make'],
        model: json['model'],
        yearOfManufacture: json['yearOfManufacture'],
        transmission: json['transmission'],
        fuelType: json['fuelType'],
        mot: json['mot'],
        taxed: json['taxed'],
        insured: null,
        motDetails: json['motDetails'],
        taxDetails: json['taxDetails'],
        insuranceDetails: null,
        isFavourite: false,
      );
    } else {
      return Car(
        numberplate: null,
        make: null,
        model: null,
        yearOfManufacture: null,
        transmission: null,
        fuelType: null,
        mot: null,
        taxed: null,
        insured: null,
        motDetails: null,
        taxDetails: null,
        insuranceDetails: null,
        isFavourite: null,
      );
    }
  }

  @override
  int compareTo(Car other) {
    int aVal, bVal;
    if (isFavourite) {
      aVal = 0;
    } else {
      aVal = 1;
    }

    if (other.isFavourite) {
      bVal = 0;
    } else {
      bVal = 1;
    }

    if (aVal < bVal) {
      return -1;
    }
    if (bVal < aVal) {
      return 1;
    }
    return 0;
  }
}

List<Car> cars = [];
