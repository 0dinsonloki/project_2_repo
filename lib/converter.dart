import 'package:flutter/material.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  TextEditingController kgController = TextEditingController();
  String result = "";

  void convert() {
    String input = kgController.text;
    if (input.isNotEmpty) {
      double kg = double.tryParse(input) ?? 0;
      double lbs = kg * 2.20462;
      setState(() {
        result = "$kg kg = ${lbs.toStringAsFixed(2)} lbs";
      });
    } else {
      setState(() {
        result = "Please enter a value.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weight Converter"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: kgController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter weight in KG",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: convert,
              child: Text("Convert to lbs"),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}