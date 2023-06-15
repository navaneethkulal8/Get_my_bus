import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final String startingLocation;
  final String endDestination;

  const MapPage(
      {Key? key, required this.startingLocation, required this.endDestination})
      : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(0, 0), // Set initial map center
          zoom: 12, // Set initial zoom level
        ),
        markers: _createMarkers(),
        polylines: _createPolylines(),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    // Create markers for starting and ending destinations
    // You can customize the marker icons and positions according to your needs
    return {
      Marker(
        markerId: MarkerId('Starting Location'),
        position: LatLng(0, 0), // Set starting location coordinates
        infoWindow: InfoWindow(title: 'Starting Location'),
      ),
      Marker(
        markerId: MarkerId('End Destination'),
        position: LatLng(0, 0), // Set end destination coordinates
        infoWindow: InfoWindow(title: 'End Destination'),
      ),
    };
  }

  Set<Polyline> _createPolylines() {
    // Create polylines to display the route
    // You can customize the polyline colors and coordinates according to your needs
    return {
      Polyline(
        polylineId: PolylineId('Route'),
        points: <LatLng>[
          LatLng(0, 0), // Set starting location coordinates
          LatLng(0, 0), // Set intermediate coordinates
          LatLng(0, 0), // Set end destination coordinates
        ],
        color: Colors.blue,
        width: 3,
      ),
    };
  }
}
