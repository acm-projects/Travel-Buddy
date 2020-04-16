import 'package:flutter/material.dart';

class DynamicallyAddCheckbox extends StatefulWidget {
  @override
  _DynamicallyAddCheckboxState createState() => _DynamicallyAddCheckboxState();
}

class _DynamicallyAddCheckboxState extends State<DynamicallyAddCheckbox> {
  List<int> _list = [1, 2, 3, 4, 5];
  bool _isChecked = true;

  _onPressed() {
    int count = _list.length;
    setState(() {
      _list.add(count + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tolietries"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: _onPressed,
              child: Text("Add Item"),
              color: Color.fromRGBO(8, 66, 86, 1.0),
            ),
          ),
          Column(
            children: _list
                .map((t) => CheckboxListTile(
              title: Text("$t"),
              value: _isChecked,
              onChanged: (val) {
                setState(() {
                  _isChecked = val;
                });
              },
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}