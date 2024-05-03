import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationMarketScreen extends StatelessWidget {
  const LocationMarketScreen({
    Key? key,
    required this.lat,
    required this.lng,
  }) : super(key: key);

  final double lat, lng;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 7,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('location'),
            position: LatLng(lat, lng),
          ),
        },
      ),
    );
  }
}
