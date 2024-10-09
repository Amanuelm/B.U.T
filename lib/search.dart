import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'build.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _allItems = [
    'Manchester United',
    'Barcelona',
    'Real Madrid',
    'Liverpool',
    'Bayern Munich'
  ];
  List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      _filteredItems =
          _allItems.where((item) => item.contains(_controller.text)).toList();
    });
  }

  void _onItemSelected(String item) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuildPage()),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Page',
          style: GoogleFonts.acme(
            fontSize: 24, // Set font size
            color: Color(0xFF35732F), // Set font color to black
          ),
        ),
        backgroundColor: Color(0xFF9AC0A9),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                hintText: 'Type to search...', // Adding hint text
                hintStyle: TextStyle(
                  // Custom style for hint text
                  color: Colors.grey, // Hint text color
                  fontStyle: FontStyle.italic, // Hint text style
                  fontSize: 18, // Hint text size
                ),
                fillColor: Colors.lightBlue[
                    50], // Change this to your desired background color
                filled: true,
              ),
              style: TextStyle(
                // Custom style for input text
                fontSize: 18, // Input text size
                color: Colors.black, // Input text color
                fontWeight: FontWeight.bold, // Input text weight
                fontStyle: FontStyle.normal, // Input text style (normal)
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Container(
                        padding:
                            EdgeInsets.all(8), // Padding inside the container
                        color: Color(0xFF9AC0A9), // Background color
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _filteredItems[index],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF35732F),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ClipOval(
                                  child: Image.asset(
                                'assets/images/icon.png', // Path to the image asset
                                width: 40, // Adjust the size of the image
                                height: 40,
                              )),
                            ])),
                    onTap: () => _onItemSelected(_filteredItems[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
