import 'dart:async';
import 'package:campusguidenew/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
class LiveLocationTracker extends StatefulWidget {
  double? lat;
  double? lang;
  LocationData? sourceCurrentLocationData;
  LiveLocationTracker(this.lat, this.lang,this.sourceCurrentLocationData);

  @override
  _LiveLocationTrackerState createState() => _LiveLocationTrackerState();

}

class _LiveLocationTrackerState extends State<LiveLocationTracker> {
  final Completer<GoogleMapController> controller = Completer();
  GoogleMapController? googleMapController;
  Location location = Location();
  List<LatLng> polyLineCoordinates = [];
  LocationData? currentLocation ;
  Set<Polyline> polilines = {};
  List<LatLng> allLatlng = [];
  BitmapDescriptor currentIcon = BitmapDescriptor.defaultMarker;
  late Timer _timer;



  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) =>
    {
      currentLocation = location
    });
     googleMapController = await controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            zoom: 13.5,
            target: LatLng(newLoc.latitude!, newLoc.longitude!)),
      ));
      setState(() {

      });
    });
    allLatlng =  [
      LatLng( currentLocation!.latitude!, currentLocation!.longitude!),
      LatLng(widget.lat!, widget.lang!)
    ];
    polilines.add(
        Polyline(polylineId: PolylineId('1'),
            points: allLatlng
        )
    );
    setState(() {

    });
  }

  @override
  void initState() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      // do something
    });
    currentLocation = widget.sourceCurrentLocationData;
    getCurrentLocation();
    setCustomIcon();
    super.initState();
  }
  @override
  void dispose() {
    _timer.cancel(); // cancel the timer in the dispose() method
    super.dispose();
  }
  @override
  void setState(VoidCallback fn) {
    if (mounted) { // check if the widget is still mounted
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.sourceCurrentLocationData == null ?
      Center(child: CircularProgressIndicator(color: Colors.blue,)) :
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(
                currentLocation!.latitude!, currentLocation!.longitude!),
            zoom: 13.5,
          ),
          markers: {
            Marker(
              markerId: MarkerId(
                'Current Location',
              ),
              icon: currentIcon,
              position: LatLng(
                  currentLocation!.latitude!, currentLocation!.longitude!),
            ),
            Marker(
                markerId: MarkerId(
                  'Source',
                ),
                position: LatLng(widget.sourceCurrentLocationData!.latitude!, widget.sourceCurrentLocationData!.longitude!)
            ),
            Marker(
                markerId: MarkerId(
                  'Destination',
                ),
                position: LatLng(widget.lat!, widget.lang!)
            ),
          },
          polylines: {
            Polyline(
              polylineId: PolylineId('Route'),
              points: allLatlng,
              color: Colors.blue,
              width: 9,
            ),
          },
          onMapCreated: (mapController) {
            controller.complete(mapController);
          },
        ),
    );
  }

  // void getPolyPoints(){
  //   // PolylinePoints polylinePoints = PolylinePoints();
  //   // PolylineResult result = await  polylinePoints.getRouteBetweenCoordinates(
  //   //   google_api_key,
  //   //   PointLatLng(widget.source!.latitude!, widget.source!.longitude!),
  //   //   PointLatLng(widget.lat!, widget.lang!),
  //   // );
  //   // if (result.points.isNotEmpty){
  //   //   for (var point in result.points) {
  //   //     polyLineCoordinates.add(
  //   //      LatLng(point.latitude, point.longitude),
  //   //    );
  //   //   }
  //   // }
  //
  //
  // }


  void setCustomIcon() {
    BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/images/nv3.png',).then((icon) {
      currentIcon = icon;
    });
  }

}
