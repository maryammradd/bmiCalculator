import 'package:flutter/material.dart';

class UnitConverter extends StatefulWidget {
  @override
  _UnitConverterState createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final TextEditingController _controller = TextEditingController();
  String _selectedUnit = "Meters to Kilometers";
  String _result = "";

  final Map<String, double> _conversionRates = {
    "Meters to Kilometers": 0.001,
    "Kilometers to Meters": 1000,
    "Grams to Kilograms": 0.001,
    "Kilograms to Grams": 1000,

  };

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input != null) {
      final rate = _conversionRates[_selectedUnit]!;
      setState(() {
        _result = (input * rate).toStringAsFixed(2);
      });
    } else {
      setState(() {
        _result = "Invalid input";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Unit Converter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter value",
              ),
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: _selectedUnit,
              items: _conversionRates.keys
                  .map((unit) => DropdownMenuItem(
                value: unit,
                child: Text(unit),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedUnit = value!;
                });
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _convert,
              child: Text("Convert"),
            ),
            SizedBox(height: 16),
            Text(
              "Result: $_result",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}