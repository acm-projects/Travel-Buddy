import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelbuddyapp/app/data/eventData.dart';
import 'dart:async';

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

class Home extends StatefulWidget {
  @override
  HomePage createState() => HomePage();
}

class HomePage extends State<Home>{
  var current;
  var time = '';
  var greetingMsg = '';
  @override
  void initState() {
    super.initState();

    current = DateTime.now();
    greetingMsg = greeting().toString();

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        current = DateTime.now();
        time = DateFormat.jms().format(current);
      });
    });
  }

  Widget build(BuildContext context) {
    var now = new DateTime.now();
    var date = DateFormat('EEEE, d MMMM, yyyy').format(now);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229,229,229),
          iconTheme: new IconThemeData(color: Color.fromARGB(255, 74, 95, 122)),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text(''),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 74,95,122)
                ),
              ),
              ListTile(
                title: Text('Add Event'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/addEvent');
                },
              ),
              // ListTile(
              //   title: Text('Itinerary'),
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.pushNamed(context, '/itinerary');
              //   },
              // ),
              ListTile(
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/logout');
                },
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 229,229,229),
        body: SingleChildScrollView(
            child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                              children: <Widget>[
                                Container(
                                    margin: new EdgeInsets.only(left: 20.0, right: 20.0, top: 15),
                                    child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/walter-white-secuela-breaking-bad-1560364306.jpg')
                                    )
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text('Good ' + greetingMsg + ', userName',
                                            style: TextStyle(fontSize: 20)
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text('You have ' + eventData.events.length.toString() + ' events on your calendar today.',
                                            style: TextStyle(height: 1.5)
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ]
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: Container(
                                    width: double.infinity,
                                    margin: new EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0, top: 5.0),
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 74,95,122),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Column(
                                        children: <Widget>[
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Flexible(
                                                  child:
                                                  Container(
                                                      margin: EdgeInsets.only(top: 10),
                                                      height: 105,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                'https://www.aconsciousrethink.com/wp-content/uploads/2018/02/sunrise-quotes-702x336.jpg'),
                                                            fit: BoxFit.cover),
                                                        borderRadius: BorderRadius.circular(40),
                                                      ),
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: <Widget>[
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Text( time, style: TextStyle(color: Colors.white, fontSize: 24))
                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: <Widget>[
                                                                Text(date, style: TextStyle(color: Colors.white, fontSize: 20))
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                  )
                                              ),
                                            ],
                                          ),
                                          Column(
                                            children: <Widget>[
                                              for( var event in eventData.events ) eventItem(event.toString())
                                            ],
                                          )
                                        ]
                                    ),
                                  )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
            )
        )
    );
  }

  Widget eventItem(event){
    return Container(
        margin: new EdgeInsets.only(bottom: 10.0, top: 10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
              colors: [
                Color(0xFF0288D1).withOpacity(0.05),
                Color(0xFF01579B).withOpacity(0.02)
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft
          ),
        ),
        child: FlatButton(
          onPressed: () => {
            print(event),
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(left: 10, right:25),
                      child: Text('3 AM', style: TextStyle(color: Colors.white))
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 25, bottom: 25, left: 15, right:10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(event, style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text("99 E 52 St. New York, NY 10022", style: TextStyle(color: Colors.white))
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        )
    );
  }
}
