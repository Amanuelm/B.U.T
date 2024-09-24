import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _allItems = ['apple', 'banana', 'avocado', 'grape', 'mango'];
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
    // Here you can call build.dart or navigate to another page
    // For example:
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BuildPage(name: item)),
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
        title: Text('Search Page'),
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

class BuildPage extends StatelessWidget {
  final String name;

  BuildPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Build Page')),
      body: Center(
        child: Text('Selected item: $name'),
      ),
    );
  }
}
