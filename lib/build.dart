import 'package:flutter/material.dart';

class BuildPage extends StatefulWidget {
  @override
  _BuildPageState createState() => _BuildPageState();
}

class _BuildPageState extends State<BuildPage> {
  String? selectedFormation = '4-4-2';
  bool isFlipped = false;

  String selectedButton = 'person'; // Default is 'person'

  List<Offset> positions = [
    Offset(160, 24),
    Offset(20, 124),
    Offset(105, 124),
    Offset(215, 124),
    Offset(305, 124),
    Offset(20, 234),
    Offset(105, 234),
    Offset(215, 234),
    Offset(305, 234),
    Offset(105, 344),
    Offset(215, 344)
  ];

  void updateFormation() {
    setState(() {
      if (selectedFormation == '4-4-2') {
        positions = [
          Offset(160, 24),
          Offset(20, 124),
          Offset(105, 124),
          Offset(215, 124),
          Offset(305, 124),
          Offset(20, 234),
          Offset(105, 234),
          Offset(215, 234),
          Offset(305, 234),
          Offset(105, 344),
          Offset(215, 344)
        ];
      } else if (selectedFormation == '4-3-3') {
        positions = [
          Offset(160, 24),
          Offset(20, 124),
          Offset(105, 124),
          Offset(215, 124),
          Offset(305, 124),
          Offset(40, 234),
          Offset(160, 234),
          Offset(285, 234),
          Offset(160, 344),
          Offset(40, 344),
          Offset(285, 344)
        ];
      } else if (selectedFormation == '4-2-3-1') {
        positions = [
          Offset(160, 24),
          Offset(20, 124),
          Offset(105, 124),
          Offset(215, 124),
          Offset(305, 124),
          Offset(105, 234),
          Offset(40, 344),
          Offset(215, 234),
          Offset(162, 454),
          Offset(160, 344),
          Offset(285, 344)
        ];
      }
      if (isFlipped) flipPositions();
    });
  }

  void flipPositions() {
    setState(() {
      double maxWidth = MediaQuery.of(context).size.width - 70;
      double maxHeight = MediaQuery.of(context).size.height - 250;
      positions = positions.map((pos) {
        return Offset(maxWidth - pos.dx, maxHeight - pos.dy);
      }).toList();
    });
  }

  void toggleFlip() {
    setState(() {
      isFlipped = !isFlipped;
      flipPositions();
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
            _buildTopControls(),
            Expanded(child: _buildFootballPitch()),
          ],
        ),
      ),
    );
  }

  Widget _buildTopControls() {
    return Container(
      alignment: Alignment.center,
      width: 900, // Reduced width
      height: 80.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconButton(Icons.person_4, 'person'),
            SizedBox(width: 30),
            _buildIconButton(Icons.shield_outlined, 'shield'),
            SizedBox(width: 30),
            _buildIconButton(Icons.numbers, 'numbers'),
            SizedBox(width: 30),
            _buildFormationDropdown(),
            SizedBox(width: 30),
            _buildFlipButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String buttonType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedButton = buttonType;
        });
      },
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: selectedButton == buttonType
              ? Colors.black
              : Color.fromARGB(255, 47, 144, 38),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }

  Widget _buildFootballPitch() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/fp.jpg',
            fit: BoxFit.cover,
          ),
        ),
        for (int i = 0; i < positions.length; i++)
          Positioned(
            left: positions[i].dx,
            top: positions[i].dy,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  positions[i] = Offset(
                    positions[i].dx + details.delta.dx,
                    positions[i].dy + details.delta.dy,
                  );
                });
              },
              child: _buildPlayer(i + 1),
            ),
          ),
      ],
    );
  }

  Widget _buildPlayer(int playerNumber) {
    if (selectedButton == 'person') {
      return _buildPlayerNode('Player $playerNumber', Colors.redAccent);
    } else if (selectedButton == 'shield') {
      return _buildPlayerBadge('Player $playerNumber', Colors.redAccent);
    } else if (selectedButton == 'numbers') {
      return _buildPlayerSquare('$playerNumber', Colors.redAccent);
    }
    return Container();
  }

  Widget _buildPlayerSquare(String number, Color color) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: Center(
        child: Text(
          number,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

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

  Widget _buildPlayerBadge(String playerName, Color color) {
    return ClipPath(
      clipper: ShieldClipper(),
      child: Container(
        width: 70,
        height: 70,
        color: color,
        child: Center(
          child: Text(
            playerName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildFormationDropdown() {
    return DropdownButton<String>(
      dropdownColor: Color.fromARGB(255, 27, 109, 20),
      value: selectedFormation,
      items: <String>['4-4-2', '4-2-3-1', '4-3-3'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          selectedFormation = newValue;
          updateFormation();
        });
      },
    );
  }

  Widget _buildFlipButton() {
    return IconButton(
      icon: Icon(
        isFlipped ? Icons.arrow_upward_sharp : Icons.arrow_downward_sharp,
        color: Colors.black,
        size: 30.0,
      ),
      onPressed: toggleFlip,
    );
  }
}

class ShieldClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(
        size.width, size.height, size.width * 0.5, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height * 0.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
