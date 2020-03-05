import 'package:flutter/material.dart';

void main() => runApp(TravelBuddyApp());

class TravelBuddyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0288D1),
      ),
      home: LoginPage()
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 175, right: 50.0, left: 50.0, bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/tblogo.png'),
            SizedBox(height: 40.0,),
            SizedBox(height: 40.0,),
            buildTextField("Email"),
            SizedBox(height: 5.0,),
            buildTextField("Password"),
            SizedBox(height: 10.0,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgotten Password?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ]
              ),
            ),
            SizedBox(height: 20.0),
            buildButtonContainer(),
            SizedBox(height: 10.0,),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?", style: TextStyle(color: Colors.black,)),
                    SizedBox(width: 10.0,),
                    Text("SIGN UP", style: TextStyle(color: Colors.black,))
                  ],
                ),
              ),
            ),
          ]
        ),
      )
    );
  }

  Widget buildTextField(String hintText){
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: hintText == "Email" ? Icon(Icons.email): Icon(Icons.lock),
        suffixIcon: hintText == "Password" ? IconButton(
          onPressed: (){},
          icon: Icon(Icons.visibility_off),
        ): Container()
      ),
    );
  }

  Widget buildButtonContainer(){
    return Container(
      height: 30.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFF0288D1),
            Color(0xFF01579B)
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft
        ),
      ),
      child: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        )
      ),
    );
  }
}