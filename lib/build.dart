import 'package:flutter/material.dart';

class BbuildPage extends StatefulWidget {
  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BbuildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a scrollable layout with toolbar that appears when scrolled
      body: CustomScrollView(),
    );
  }
}
