import 'package:flutter/material.dart';
import './app/login.dart';
import 'app/home.dart';
import 'app/addEvent.dart';
import 'app/itinerary.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/',
  routes: {
    '/': (context) => LoginPage(),
    '/home': (context) => Home(),
    '/addEvent': (context) => AddEvent(),
    '/itinerary': (context) => Itinerary(),
    '/eventDetails': (context) => Itinerary(),
    '/logout': (context) => LoginPage()
  },
)
);
