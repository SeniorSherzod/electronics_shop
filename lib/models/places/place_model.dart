import 'package:electronics_shop/models/places/place_category.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/images/images.dart';

class PlaceModel {
  final String? id;
  late LatLng latLng;
  final String placeName;
  late PlaceCategory placeCategory;
  final String entrance;
  final String stage;
  final String flatNumber;
  final String orientAddress;
  final String image;
  final String docId;

  PlaceModel({
    this.id,
    required this.latLng,
    required this.docId,
    required this.placeName,
    required this.placeCategory,
    required this.entrance,
    required this.stage,
    required this.flatNumber,
    required this.orientAddress,
    this.image = '',
  });

  PlaceModel copywith({
    String? id,
    LatLng? latLng,
    String? placeName,
    PlaceCategory? placeCategory,
    String? entrance,
    String? stage,
    String? flatNumber,
    String? docId,
    String? orientAddress,
  }) {
    return PlaceModel(
        latLng: latLng ?? this.latLng,
        docId: docId ?? this.docId,
        placeName: placeName ?? this.placeName,
        placeCategory: placeCategory ?? this.placeCategory,
        entrance: entrance ?? this.entrance,
        stage: stage ?? this.stage,
        flatNumber: flatNumber ?? this.flatNumber,
        orientAddress: orientAddress ?? this.orientAddress);
  }

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
        id: json['id'] as String? ?? "",
        latLng: const LatLng(41.2995, 69.2401),
        placeName: json['placeName'] as String? ?? "",
        docId: json['doc_id'] as String? ?? "",
        placeCategory: PlaceCategory.work,
        entrance: json['entrance'] as String? ?? "",
        stage: json['stage'] as String? ?? "",
        flatNumber: json['flatNumber'] as String? ?? "",
        orientAddress: json['orientAddress'] as String? ?? "",
        image: json['image'] as String? ?? AppImages.home);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': "",
      'doc_id': docId,
      'latLng': {
        'latitude': latLng.latitude,
        'longitude': latLng.longitude,
      },
      'placeName': placeName,
      'placeCategory': placeCategory.toJson(),
      'entrance': entrance,
      'stage': stage,
      'flatNumber': flatNumber,
      'orientAddress': orientAddress,
    };
  }

  Map<String, dynamic> toUpdateJson() {
    return {
      'latLng': {
        'latitude': latLng.latitude,
        'longitude': latLng.longitude,
      },
      'placeName': placeName,
      'placeCategory': placeCategory.toJson(),
      'entrance': entrance,
      'stage': stage,
      'flatNumber': flatNumber,
      'orientAddress': orientAddress,
    };
  }

  static PlaceModel initialvalue() => PlaceModel(
      latLng: const LatLng(0, 0),
      placeName: "",
      placeCategory: const PlaceCategory(""),
      entrance: "",
      stage: "",
      flatNumber: "",
      orientAddress: "",
      docId: '');
}
