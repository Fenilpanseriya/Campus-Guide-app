import 'dart:async';
import 'package:campusguidenew/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CurrentLocation extends StatefulWidget {

  LocationData? sourceCurrentLocationData;

  CurrentLocation( this.sourceCurrentLocationData);

  @override
  State<CurrentLocation> createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  final Completer<GoogleMapController> controller = Completer();
  LocationData? currentLocation;

  List<LatLng> polyLineCoordinates = [];
  List<LatLng> allLatlng = [
    LatLng(22.679749, 72.880363),
  ];

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) => {currentLocation = location});
    allLatlng
        .add(LatLng(currentLocation!.latitude!, currentLocation!.longitude!));
    GoogleMapController googleMapController = await controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 13.5, target: LatLng(newLoc.latitude!, newLoc.longitude!)),
      ));
      setState(() {});
    });

    setState(() {});
  }

  @override
  void initState() {
    currentLocation = widget.sourceCurrentLocationData;
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of(context);
    provider.getCurrentLocation();
    return Scaffold(
      body: provider.currentLocationData==null?Center(child: CircularProgressIndicator(color: Colors.blue,)):
      GoogleMap(
        initialCameraPosition: CameraPosition(
          target:
              LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 13.5,
        ),
        markers: {
          Marker(
            markerId: MarkerId(
              'Current Location',
            ),
            infoWindow: InfoWindow(
              title: 'Current Location',
            ),
            position:
                LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
          Marker(
              markerId: MarkerId('0'),
              position: LatLng(22.679749, 72.880363),
              infoWindow: InfoWindow(title: 'Destination')),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('Route'),
            points: allLatlng,
            color: Colors.blue,
            width: 9,
          ),
        },
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController scontroller) {
          controller.complete(scontroller);
        },
      ),

    );
  }
}
