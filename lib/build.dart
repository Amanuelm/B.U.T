import 'package:flutter/material.dart';

class BbuildPage extends StatefulWidget {
  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BbuildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Build Page')),
        body: Container(
          color: Colors.green,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                SizedBox(width: 20),
                Icon(
                  Icons.account_circle_outlined,
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
                SizedBox(width: 20),
                Icon(
                  Icons.sports_golf,
                  color: Colors.black,
                  size: 40.0,
                ),
              ]),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/images/fp.jpg'),
              ),
            ],
          ),
        ));
  }
}
