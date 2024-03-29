import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationModel {
  final String name;
  final LatLng coordinates;
  final String category;

  LocationModel({
    required this.name,
    required this.coordinates,
    required this.category});
}