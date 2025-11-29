class Car {
  final String carName;
  final int cc;
  final int cylinders;
  final int carOdometer;
  final int year;
  final int literPrice;

  Car({
    required this.carName,
    required this.literPrice,

    required this.year,
    required this.cc,
    required this.cylinders,
    required this.carOdometer,
  });

  Map<String, dynamic> toMap() {
    return {
      'carName': carName,
      'literPrice': literPrice,
      'year': year,
      'cc': cc,
      'cylinders': cylinders,
      'carOdometer': carOdometer,
    };
  }
}
