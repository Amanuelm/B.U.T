import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BbuildPage extends StatefulWidget {
  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BbuildPage> {
  String? selectedItem = '4-4-2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Build Page'),
          backgroundColor: Color(0xFF9AC0A9),
        ),
        body: Container(
          color: Color(0xFF35732F),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(
                            255, 47, 144, 38), // Background color
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 0, 1, 2), // Border color
                          width: 3, // Border width
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.person_4,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.sports_soccer_outlined,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.sports_soccer_outlined,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    DropdownButton<String>(
                      value: selectedItem,
                      items: <String>['4-4-2', '4-2-3-1', '4-3-3']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedItem = newValue!;
                        });
                      },
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.sports_baseball,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    SizedBox(width: 20),
                    Icon(
                      Icons.sports_soccer_sharp,
                      color: Colors.black,
                      size: 40.0,
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/images/fp.jpg'),
              ),
            ],
          ),
        ));
  }
}
