import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildPage extends StatefulWidget {
  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  String? selectedItem = '4-4-2';
  bool direction = true;
  Offset player1Position = Offset(145, 24);
  Offset player2Position = Offset(5, 124);
  Offset player3Position = Offset(95, 124);
  Offset player4Position = Offset(200, 124);
  Offset player5Position = Offset(295, 124);
  Offset player6Position = Offset(5, 234);
  Offset player7Position = Offset(95, 234);
  Offset player8Position = Offset(200, 234);
  Offset player9Position = Offset(295, 234);
  Offset player10Position = Offset(95, 344);
  Offset player11Position = Offset(200, 344);
  void flip(BuildContext context) {
    setState(() {
      direction = !direction;
      double maxW = MediaQuery.of(context).size.width - 70;
      double maxH = MediaQuery.of(context).size.height - 250;
      if (direction == false) {
        player1Position = Offset(maxW - 145, maxH - 24);
        player2Position = Offset(maxW - 5, maxH - 124);
        player3Position = Offset(maxW - 95, maxH - 124);
        player4Position = Offset(maxW - 200, maxH - 124);
        player5Position = Offset(maxW - 295, maxH - 124);
        player6Position = Offset(maxW - 5, maxH - 234);
        player7Position = Offset(maxW - 90, maxH - 234);
        player8Position = Offset(maxW - 200, maxH - 234);
        player9Position = Offset(maxW - 295, maxH - 234);
        player10Position = Offset(maxW - 90, maxH - 344);
        player11Position = Offset(maxW - 200, maxH - 344);
      } else {
        player1Position = Offset(145, 24);
        player2Position = Offset(5, 124);
        player3Position = Offset(90, 124);
        player4Position = Offset(200, 124);
        player5Position = Offset(295, 124);
        player6Position = Offset(5, 234);
        player7Position = Offset(90, 234);
        player8Position = Offset(200, 234);
        player9Position = Offset(295, 234);
        player10Position = Offset(90, 344);
        player11Position = Offset(200, 344);
      }
    });
  }

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
              // Top control section
              Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    SizedBox(width: 20),
                    // Icon row
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 144, 38),
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 1, 2),
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        children: [
                          SizedBox(width: 5),
                          Icon(
                            Icons.person_4,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.shield_outlined,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          SizedBox(width: 20),
                          Icon(
                            Icons.numbers,
                            color: Colors.black,
                            size: 40.0,
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    // Dropdown for formations
                    Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 47, 144, 38),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 1, 2),
                          width: 3,
                        ),
                      ),
                      child: DropdownButton<String>(
                        dropdownColor: Color.fromARGB(255, 27, 109, 20),
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
                    ),
                    SizedBox(width: 20),
                    // Direction change button
                    IconButton(
                      icon: Icon(
                        direction
                            ? Icons.arrow_downward_sharp
                            : Icons.arrow_upward_sharp,
                        color: Colors.black,
                        size: 40.0,
                      ),
                      onPressed: () {
                        flip(context);
                      },
                    ),
                    const SizedBox(width: 20),
                    // Football icon
                    Icon(
                      Icons.sports_soccer_sharp,
                      color: Colors.black,
                      size: 40.0,
                    ),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              // Expanded stack to properly layout the football pitch and draggable players
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/fp.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: player1Position.dx,
                      top: player1Position.dy,
                      child: Draggable(
                        data: 'Player 1',
                        feedback:
                            _buildPlayerNode('Player 1', Colors.redAccent),
                        child: _buildPlayerNode('Player 1', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player2Position.dx,
                      top: player2Position.dy,
                      child: Draggable(
                        data: 'Player 2',
                        feedback:
                            _buildPlayerNode('Player 2', Colors.redAccent),
                        child: _buildPlayerNode('Player 2', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player3Position.dx,
                      top: player3Position.dy,
                      child: Draggable(
                        data: 'Player 3',
                        feedback:
                            _buildPlayerNode('Player 3', Colors.redAccent),
                        child: _buildPlayerNode('Player 3', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player4Position.dx,
                      top: player4Position.dy,
                      child: Draggable(
                        data: 'Player 4',
                        feedback:
                            _buildPlayerNode('Player 4', Colors.redAccent),
                        child: _buildPlayerNode('Player 4', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player5Position.dx,
                      top: player5Position.dy,
                      child: Draggable(
                        data: 'Player 5',
                        feedback:
                            _buildPlayerNode('Player 5', Colors.redAccent),
                        child: _buildPlayerNode('Player 5', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player6Position.dx,
                      top: player6Position.dy,
                      child: Draggable(
                        data: 'Player 6',
                        feedback:
                            _buildPlayerNode('Player 6', Colors.redAccent),
                        child: _buildPlayerNode('Player 6', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player7Position.dx,
                      top: player7Position.dy,
                      child: Draggable(
                        data: 'Player 7',
                        feedback:
                            _buildPlayerNode('Player 7', Colors.redAccent),
                        child: _buildPlayerNode('Player 7', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player8Position.dx,
                      top: player8Position.dy,
                      child: Draggable(
                        data: 'Player 8',
                        feedback:
                            _buildPlayerNode('Player 8', Colors.redAccent),
                        child: _buildPlayerNode('Player 8', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player9Position.dx,
                      top: player9Position.dy,
                      child: Draggable(
                        data: 'Player 9',
                        feedback:
                            _buildPlayerNode('Player 9', Colors.redAccent),
                        child: _buildPlayerNode('Player 9', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player10Position.dx,
                      top: player10Position.dy,
                      child: Draggable(
                        data: 'Player 10',
                        feedback:
                            _buildPlayerNode('Player 10', Colors.redAccent),
                        child: _buildPlayerNode('Player 10', Colors.redAccent),
                      ),
                    ),
                    Positioned(
                      left: player11Position.dx,
                      top: player11Position.dy,
                      child: Draggable(
                        data: 'Player 11',
                        feedback:
                            _buildPlayerNode('Player 11', Colors.redAccent),
                        child: _buildPlayerNode('Player 11', Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  // Function to build the draggable player node
  Widget _buildPlayerNode(String playerName, Color color) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          playerName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // Helper function to ensure players stay within the screen bounds
//   double _ensureInBounds(double value, BuildContext context) {
//     double maxWidth = MediaQuery.of(context).size.width;
//     double maxHeight = MediaQuery.of(context).size.height;
//     // Ensure that the player stays within screen limits
//     if (value < 0) return 0;
//     if (value > maxWidth - 60) return maxWidth - 60;
//     if (value > maxHeight - 60) return maxHeight - 60;
//     return value;
//   }
}
