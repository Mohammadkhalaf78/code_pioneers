// models/coordiantes.dart
class Coordiantes {
  final double latitude;
  final double longitude;
  final String placeName;
  final double? distanceKm; // المسافة من مرجعية (كم)
  final bool visited;       // أثناء بناء المسار
  final int? order;         // ترتيب الزيارة في المسار النهائي

  Coordiantes({
    required this.placeName,
    required this.latitude,
    required this.longitude,
    this.distanceKm,
    this.visited = false,
    this.order,
  });

  Coordiantes copyWith({
    double? distanceKm,
    bool? visited,
    int? order,
  }) {
    return Coordiantes(
      placeName: placeName,
      latitude: latitude,
      longitude: longitude,
      distanceKm: distanceKm ?? this.distanceKm,
      visited: visited ?? this.visited,
      order: order ?? this.order,
    );
  }
}


// class Coordiantes {
//   final double latitude;
//   final double longitude;
//   final String placeName;
//   double? distanceKm; // nullable وممكن تتحدَّث

//   Coordiantes({
//     required this.placeName,
//     required this.latitude,
//     required this.longitude,
//     this.distanceKm,
//   });
// }
