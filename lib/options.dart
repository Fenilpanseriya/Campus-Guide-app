import 'package:campusguidenew/ui/dropdown/dropdown1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'ui/dropdown/dropdown2.dart';
import 'ui/dropdown/dropdpwn3.dart';

class Options extends StatefulWidget {
  const Options({super.key, required int selected});

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  int selectedValue = 0;
  bool Next = false;

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
                          ' Destination',
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
                              "Class",
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
                              "Labs",
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
                              "Other Facilities",
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
                          setState(() {
                            Next = true;
                          });
                          if (selectedValue == 0) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Dropdown1(selected: Next)));
                          } else if (selectedValue == 1) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Dropdown2(selected: Next)));
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Dropdown3(selected: Next)));
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
