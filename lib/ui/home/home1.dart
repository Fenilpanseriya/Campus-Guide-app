import 'package:campusguidenew/provider/provider.dart';
import 'package:campusguidenew/ui/google_maps/current_location.dart';
import 'package:campusguidenew/ui/google_maps/current_location1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../floor.dart';

class Home1 extends StatefulWidget {
  static const String routName = 'Home1';

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  bool liveLocation = false;
  // bool direction = false;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    provider.getCurrentLocation();

    return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              image: AssetImage('assets/images/back1.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.34,
                  bottom: MediaQuery.of(context).size.height * 0.01,
                  left: 10,
                  right: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: 450,
                height: 548,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'CAMPUS',
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 50),
                        ),
                      ),
                      const Text(
                        'Guide',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.06,
                            bottom: MediaQuery.of(context).size.height * 0.01,
                            left: 10,
                            right: 10),
                        child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                         color: Colors.black

                        ),
                          width: 350,
                          height: 300,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200.0,
                                  height: 70.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {//setState is a method inherited from the StatefulWidget class, and it notifies Flutter that the internal state of the widget has changed and needs to be updated.
                                          liveLocation = true;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CurrentLocation1(provider.currentLocationData)));
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF8f8e8e)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ))),
                                      child: const Text(
                                        'Live location',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                SizedBox(
                                  width: 200.0,
                                  height: 70.0,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          liveLocation = false;
                                        });
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => FloorSelect(
                                                    selected: liveLocation)));
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xFF8f8e8e)),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(25),
                                          ))),
                                      child: const Text(
                                        'Direction',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
