// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'build.dart';
import 'search.dart';

class choice extends StatefulWidget {
  const choice({super.key});

  @override
  State<choice> createState() => _choiceState();
}

class _choiceState extends State<choice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          // padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(240, 60)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF9AC0A9)),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.black.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BuildPage()),
                  );
                },
                child: Text(
                  'Create new team',
                  style: GoogleFonts.acme(
                    fontSize: 24, // Set font size
                    color: Color(0xFF35732F), // Set font color to black
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(240, 60)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFF9AC0A9)),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.focused) ||
                          states.contains(MaterialState.pressed))
                        return Colors.black.withOpacity(0.12);
                      return null; // Defer to the widget's default.
                    },
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Text(
                  'Use existing team',
                  style: GoogleFonts.acme(
                    // Use Acme font here
                    fontSize: 24, // Set font size
                    color: Color(0xFF35732F), // Set font color to black
                  ),
                ),
              )
            ],
          )),
    );
  }
}
