import 'package:flutter/material.dart';

void main() => runApp(TravelBuddyApp());

class TravelBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFB415B),

      ),
      home: LoginPage(),
     );
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                'Logo',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height: 40.0,),
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40.0,),
            buildTextField(),
          ]
        ),
      )
    );
  }
  Widget buildTextField(){
    return TextField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        )
      ),
    );
  }
}




