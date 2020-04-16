import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Packing()));

// Stateless widget to see live app updates
class Packing extends StatefulWidget {
  /*@override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white24,
            child: Text(
              'Packing List',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                color: Colors.grey[800],
                fontFamily: 'PlayfairDisplay',
              ),
            ),
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            child: Text(
              'Tolietries',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
                color: Colors.grey[800],
                fontFamily: 'PlayfairDisplay',
              ),
            ),
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10.0),
          ),

        ],
      )
      floatingActionButton: IconButton(
        onPressed: () {
          print('Add a new packing list.');
        },
        icon: Icon(Icons.add_circle),
        color: Colors.blueGrey[800],
        iconSize: 55.0,
      ),
    );
  }
*/
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<Packing> {
  bool _isChecked = false;

  void onChanged(bool value) {
    setState(() {
      _isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text(
          'Travel Buddy',
          style: TextStyle(
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],
      ),
      body: new Container(
          child: new Center(
              child: new Column(children: <Widget>[
            Container(
              color: Colors.white24,
              child: Text(
                'Packing List',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Colors.grey[800],
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(1.0),
            ),
            new Row(
              children: <Widget>[
                new Text('Title Category',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'PlayfairDisplay',
                    )),
              ],
            ),
            new CheckboxListTile(
                title: new Text(
                  'Shampoo',
                  style: TextStyle(fontFamily: 'PlayfairDisplay'),
                ),
                activeColor: Colors.blueGrey[800],
                value: _isChecked,
                onChanged: (bool value1) {
                  onChanged(value1);
                }),
            new CheckboxListTile(
                title: new Text(
                  'Conditioner',
                  style: TextStyle(fontFamily: 'PlayfairDisplay'),
                ),
                activeColor: Colors.blueGrey[800],
                value: _isChecked,
                onChanged: (bool value) {
                  onChanged(value);
                })
          ]))),
      floatingActionButton: IconButton(
        onPressed: () {
         // print('Add a new packing list.');
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewPackingListView()));
        },
        icon: Icon(Icons.add_circle),
        color: Colors.blueGrey[800],
        iconSize: 55.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
