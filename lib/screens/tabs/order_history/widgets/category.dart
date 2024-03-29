import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../models/location_model.dart'; // Import SvgPicture

class CategoryAlert extends StatelessWidget {
    void _showLocationSelectionDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Select a location'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLocationTile(context, 'Location 1', 'Uy'),
                _buildLocationTile(context, 'Location 2', 'Ish'),
                _buildLocationTile(context, 'Location 3', 'Boshqa'),
              ],
            ),
          );
        },
      );
    }

    // Function to build a location tile
    Widget _buildLocationTile(BuildContext context, String name, String category) {
      return ListTile(
        title: Text(name),
        onTap: () {
          // Handle location selection here
          LocationModel selectedLocation = LocationModel(name: name, category: category, coordinates: LatLng(0.0, 0.0)); // Replace coordinates with actual values
          Navigator.pop(context, selectedLocation); // Close dialog and pass selected location back to caller
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
