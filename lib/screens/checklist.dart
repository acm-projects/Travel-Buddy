import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Packing()
));

// Stateless widget to see live app updates
class Packing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Travel Buddy',
          style: TextStyle(
            fontFamily : 'PlayfairDisplay',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[600],
      ),
      body: Container(
        color: Colors.white70,
        child: Text(
          'Packing List',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            color: Colors.grey[800],
            fontFamily: 'PlayfairDisplay',
          ),
        ),
        alignment: Alignment.topCenter,
       padding: EdgeInsets.all(10.0),
      ),





        floatingActionButton : IconButton(
        onPressed: (){
          print('you clicked me');
        }, icon: Icon(Icons.add_circle),
          color: Colors.blueGrey[800],
          iconSize: 55.0,
      ),
    );
  }
}
