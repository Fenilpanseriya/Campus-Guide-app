import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ui/google_maps/LiveLocation.dart';
import 'options.dart';

class FloorSelect extends StatefulWidget {
  final bool selected;

  const FloorSelect({super.key, required this.selected});

  @override
  State<FloorSelect> createState() => _floorSelectState();
}

class _floorSelectState extends State<FloorSelect> {
  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
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
          children: <Widget>[

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
                    Column(
                      children: [
                        Text(
                          'Select',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Current Floor',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RadioListTile(
                            value: 0,
                            groupValue: selectedValue,
                            title: const Text(
                              "Ground",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            onChanged: (val) {
                              setState(() {
                                selectedValue = 0;
                              });
                            }),
                        RadioListTile(
                            value: 1,
                            groupValue: selectedValue,
                            title: const Text(
                              "First",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            onChanged: (val) {
                              setState(() {
                                selectedValue = 1;
                              });
                            }),
                        RadioListTile(
                            value: 2,
                            groupValue: selectedValue,
                            title: const Text(
                              "Second",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            onChanged: (val) {
                              setState(() {
                                selectedValue = 2;
                              });
                            }),
                      ],
                    ),
                    SizedBox(
                      height: 52,
                      width: 152,
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget.selected) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        LiveLocation(selected: selectedValue)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Options(selected: selectedValue)));
                          }
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
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
            ),
          ],
        ),
      ),
    );
  }
}
