import 'package:flutter/material.dart';
import 'package:temp/converter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void mysnackbar(String msg, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6F7FF), // Light blue background
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              mysnackbar("Search clicked", context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              mysnackbar("Settings clicked", context);
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConverterPage()),
            );
          },
          child: Text("Go to Weight Converter"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          mysnackbar("Floating button pressed", context);
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        backgroundColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            mysnackbar("Home selected", context);
          } else {
            mysnackbar("Profile selected", context);
          }
        },
      ),
    );
  }
}