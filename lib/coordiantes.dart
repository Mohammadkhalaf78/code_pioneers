class Coordiantes {
  final double latitude;
  final double longitude;
  final String placeName;
  double? distanceKm;

  Coordiantes({
    required this.placeName,
    required this.latitude,
    required this.longitude,
    this.distanceKm,
  });
}
