
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../order_traking_page.dart';

const List<String> list = <String>[
  'MMH',
  'Seminar Hall',
  'Gents Washroom',
  'Ladies Washroom',
  'Staff Washroom',
  'centerfoyar',
];

class Dropdown3 extends StatefulWidget {
  const Dropdown3({super.key, required bool selected});

  @override
  State<Dropdown3> createState() => _Dropdown3State();
}

class _Dropdown3State extends State<Dropdown3> {
  bool direction = false;
  var dropdownValue = list[0];

  @override
  Widget build(BuildContext context) {
    var dropdownButton = DropdownButton<String>(
      value: dropdownValue,
      // hint: Text(
      //   "Facilities",
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
                      'Select Facility',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    dropdownButton,
                    SizedBox(
                      height: 52,
                      width: 152,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            direction = true;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OrderTrackingPage(selected: direction)));
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
