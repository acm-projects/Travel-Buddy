import 'package:flutter/material.dart';

class Itinerary extends StatefulWidget {
  @override
  ItineraryPage createState() => ItineraryPage();
}

class ItineraryPage extends State<Itinerary>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: 100.0,),
              Text('Itinerary Page')
            ],
          )
      ),
    );
  }
}