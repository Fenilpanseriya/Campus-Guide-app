import 'package:campusguidenew/provider/provider.dart';
import 'package:campusguidenew/ui/google_maps/current_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../google_maps/navigation_screen.dart';

const List<String> list = <String>[
  'Class 1',
  'Class 2',
  'Class 3',
  'Class 4',
  'Class 5'
];

class Dropdown1 extends StatefulWidget {
  const Dropdown1({super.key, required bool selected});

  @override
  State<Dropdown1> createState() => _Dropdown1State();
}

class _Dropdown1State extends State<Dropdown1> {
  bool direction = false;
  var dropdownValue = list[0];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getCurrentLocationInDrop1();
    var dropdownButton = DropdownButton<String>(
      value: dropdownValue,
      // hint: Text(
      //   "Lab",
      //   style: TextStyle(
      //     fontSize: 25,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(
        color: Colors.deepPurple,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(
          image: AssetImage( 'assets/images/background.jpeg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Center(
              child: Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Select Class',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    dropdownButton,
                    SizedBox(
                      height: 52,
                      width: 152,
                      child: ElevatedButton(
                        onPressed: () {


                          // List<Marker> _marker = [];
                          // List<Marker> _list = const [
                          //   Marker(
                          //       markerId: MarkerId('0'),
                          //       position: LatLng(22.67458, 72.882735),
                          //       infoWindow: InfoWindow(title: 'HP HOME')),
                          //   Marker(
                          //       markerId: MarkerId('1'),
                          //       position: LatLng(22.680185, 72.880274),
                          //       infoWindow: InfoWindow(title: 'SW1')),
                          //   Marker(
                          //       markerId: MarkerId('2'),
                          //       position: LatLng(22.680100, 72.880312),
                          //       infoWindow: InfoWindow(title: 'SW2')),
                          //   Marker(
                          //       markerId: MarkerId('3'),
                          //       position: LatLng(22.679845, 72.880736),
                          //       infoWindow: InfoWindow(title: 'SW3')),
                          //   Marker(
                          //       markerId: MarkerId('4'),
                          //       position: LatLng(22.679799, 72.88071),
                          //       infoWindow: InfoWindow(title: 'SW4')),
                          //   Marker(
                          //       markerId: MarkerId('5'),
                          //       position: LatLng(22.680159, 72.88061),
                          //       infoWindow: InfoWindow(title: 'SW5')),
                          //   Marker(
                          //       markerId: MarkerId('6'),
                          //       position: LatLng(22.679749, 72.880363),
                          //       infoWindow: InfoWindow(title: 'CF')),
                          // ];
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             HomeScreen(selected: direction,selectedLabOrClass: dropdownValue,latLang:placeLatlang)));},

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CurrentLocation(provider.currentLocationData)));
                        },

                        child: Text(
                          'Direction',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                            shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ))),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
