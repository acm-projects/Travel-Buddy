import 'package:flutter/material.dart';
import 'package:travelbuddyapp/screens/authentication.dart';
import 'package:travelbuddyapp/screens/root_page.dart';


void main() => runApp(TravelBuddyApp());

class TravelBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      // added title
      title: 'Travel Buddy',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Color(0xFF0288D1),
      ),
      // this is what was there before !! home: LoginPage()
      home: new RootPage(auth: new Auth())
    );
  }
}
