import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class MyProvider extends ChangeNotifier{

LocationData? currentLocationData;//? means initial value of currentLocationData is null

void getCurrentLocation() async {
  Location location = Location();
  location.getLocation().then((location) =>
  {
    currentLocationData = location
  });
  notifyListeners();
}

void getCurrentLocationInDrop1() async {
  Location location = Location();
  location.getLocation().then((location) =>
  {
    currentLocationData = location
  });
}
}