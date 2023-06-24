import 'dart:async';
import 'package:campusguidenew/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class CurrentLocation1 extends StatefulWidget {

  LocationData? sourceCurrentLocation1Data;

  CurrentLocation1( this.sourceCurrentLocation1Data);

  @override
  State<CurrentLocation1> createState() => _CurrentLocation1State();
}

class _CurrentLocation1State extends State<CurrentLocation1> {
  final Completer<GoogleMapController> controller = Completer();
  LocationData? currentLocation1;

  List<LatLng> polyLineCoordinates = [];
  List<LatLng> allLatlng = [
    LatLng(22.679749, 72.880363),
  ];

  void getCurrentLocation1() async {
    Location location = Location();
    location.getLocation().then((location) => {currentLocation1 = location});
    allLatlng
        .add(LatLng(currentLocation1!.latitude!, currentLocation1!.longitude!));
    GoogleMapController googleMapController = await controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation1 = newLoc;
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
    currentLocation1 = widget.sourceCurrentLocation1Data;
    getCurrentLocation1();
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
              LatLng(currentLocation1!.latitude!, currentLocation1!.longitude!),
          zoom: 13.5,
        ),
        markers: {
          Marker(
            markerId: MarkerId(
              'Current Location',
            ),
            infoWindow: InfoWindow(title: 'Current Location'),
            position:
                LatLng(currentLocation1!.latitude!, currentLocation1!.longitude!),
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
