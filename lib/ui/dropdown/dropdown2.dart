import 'package:campusguidenew/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../google_maps/navigation_screen.dart';

const List<String> list = <String>[
  'Lab 1',
  'Lab 2',
  'Lab 3',
  'Lab 4',
  'Lab 5'
];


class Dropdown2 extends StatefulWidget {
  const Dropdown2({super.key, required bool selected});

  @override
  State<Dropdown2> createState() => _Dropdown2State();
}

class _Dropdown2State extends State<Dropdown2> {
  bool direction = false;
  var dropdownValue = list[0];

late MyProvider provider ;
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
                      'Select Laboratory',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    dropdownButton,
                    SizedBox(
                      height: 52,
                      width: 152,
                      child: ElevatedButton(
                        onPressed: () {
                          LatLng? placeLatlang ;
                            direction = true;
                          if (dropdownValue == 'Lab 1') {
                            placeLatlang = LatLng(22.680185, 72.880274);
                          } else if (dropdownValue == 'Lab 2') {
                            placeLatlang = LatLng(22.680100, 72.880312);
                          } else if (dropdownValue == 'Lab 3') {
                            placeLatlang = LatLng(22.679845, 72.880736);
                          } else if (dropdownValue == 'Lab 4') {
                            placeLatlang = LatLng(22.679799, 72.88071);
                          } else if (dropdownValue == 'Lab 5') {
                            placeLatlang = LatLng(22.680159, 72.88061);
                          }

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             HomeScreen(selected: direction,selectedLabOrClass: dropdownValue,latLang:placeLatlang)));},


                           // provider.getCurrentLocation();
                          final co = provider.currentLocationData;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LiveLocationTracker(placeLatlang!.latitude,placeLatlang.longitude,co)));
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
