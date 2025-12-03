// To parse this JSON data, do
//
//     final carServiceClass = carServiceClassFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<CarServiceClass> carServiceClassFromJson(String str) => List<CarServiceClass>.from(json.decode(str).map((x) => CarServiceClass.fromJson(x)));

String carServiceClassToJson(List<CarServiceClass> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarServiceClass {
    final int id;
    final DateTime? createdAt;
    final String carName;
    final int cc;
    final int cylinders;
    final int carOdometer;
    final int year;
    final int literPrice;

    CarServiceClass({
        required this.id,
         this.createdAt,
        required this.carName,
        required this.cc,
        required this.cylinders,
        required this.carOdometer,
        required this.year,
        required this.literPrice,
    });

    factory CarServiceClass.fromJson(Map<String, dynamic> json) => CarServiceClass(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        carName: json["car_Name"],
        cc: json["cc"],
        cylinders: json["cylinders"],
        carOdometer: json["carOdometer"],
        year: json["year"],
        literPrice: json["literPrice"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        // "created_at": createdAt.toIso8601String(),
        "car_Name": carName,
        "cc": cc,
        "cylinders": cylinders,
        "carOdometer": carOdometer,
        "year": year,
        "literPrice": literPrice,
    };
}
