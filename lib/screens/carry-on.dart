import 'package:flutter/material.dart';

void main() => runApp(CarryOn());

class CarryOn extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(8, 66, 86, 1.0),
      ),
      home: CheckBoxInListview(),
    );
  }
}

class CheckBoxInListview extends StatefulWidget {
  @override
  _CheckBoxInListviewState createState() => _CheckBoxInListviewState();
}

class _CheckBoxInListviewState extends State<CheckBoxInListview> {
  bool _isChecked = false;

  List<String> _texts = [
    "Passport + additional documents",
    "Hand Sanitizer",
    "Advil",
    "Sleep medication",
    "Device chargers",
    "Cameras",
    "Headphones + adapters for in flight service",
    "Travel pillow",
    "Chapstick/Lotions"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carry On",
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: _texts
            .map((text) => CheckboxListTile(
                  title: Text(
                    text,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  value: _isChecked,
                  onChanged: (val1) {
                    setState(() {
                      _isChecked = val1;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }
}
