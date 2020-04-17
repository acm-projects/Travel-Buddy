import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelbuddyapp/app/data/eventData.dart';

class AddEvent extends StatefulWidget {
  @override
  AddEventPage createState() => AddEventPage();
}

class AddEventPage extends State<AddEvent>{
  DateTime selectedDate = DateTime.now();
  TimeOfDay _currentTime = new TimeOfDay.now();

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTime,
    );
    setState(() {
      _time.value = TextEditingValue(text: selectedTime.format(context));
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.value = TextEditingValue(text: DateFormat('EEEE, d MMMM, yyyy').format(picked));

      });
  }

  TextEditingController _name = new TextEditingController();
  TextEditingController _date = new TextEditingController();
  TextEditingController _time = new TextEditingController();
  TextEditingController _description = new TextEditingController();
  TextEditingController _location = new TextEditingController();
  @override

  void dispose() {
    _name.dispose();
    _date.dispose();
    _time.dispose();
    _location.dispose();
    _description.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 229,229,229),
          iconTheme: new IconThemeData(color: Color.fromARGB(255, 74,95,122)),
          // title: Text('Add Event', style: TextStyle(color: Color.fromARGB(255, 74,95,122))),
        ),
        // backgroundColor: Color.fromARGB(255, 74,95,122),
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                  width: double.infinity,
                  // height: ,
                  margin: new EdgeInsets.only(right: 20.0, left: 20.0, bottom: 10.0, top: 20.0),
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(240, 229,229,229),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                              child: Text('Add Event', style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 74,95,122)))
                          ),
                          Container(
                            padding: EdgeInsets.only(top:10, bottom: 10),
                            child: TextField(
                              controller: _name,
                              decoration: InputDecoration(
                                labelText: 'Event Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white12,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:10, bottom: 10),
                            child: TextField(
                              controller: _date,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white12,
                              ),
                              onTap: () => {_selectDate(context)},
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:10, bottom: 10),
                            child: TextField(
                              controller: _time,
                              readOnly: true,
                              decoration: InputDecoration(
                                labelText: 'Time',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white12,
                              ),
                              onTap: () => {selectTime(context)},
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(top:10, bottom: 10),
                            child: TextField(
                              controller: _description,
                              minLines: 2,
                              maxLines: 4,
                              decoration: InputDecoration(
                                labelText: 'Description',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusColor: Colors.white12,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.only(top:10, bottom: 10),
                              child: TextField(
                                controller: _location,
                                decoration: InputDecoration(
                                  labelText: 'Location',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  focusColor: Colors.white12,
                                ),
                              )
                          ),
                          RaisedButton(
                              onPressed: () => {
                                print(_name.text),
                                print(_date.text),
                                print(_time.text),
                                print(_description.text),
                                print(_location.text),
                                eventData.events.insert(0, _name.text),
                                _onLoading(),
                                _name.clear(),
                                _date.clear(),
                                _time.clear(),
                                _location.clear(),
                                _description.clear()
                              },
                              color: Colors.blue,
                              child: Text('Submit')
                          )
                        ],
                      )
                  ),
                )
            )
        )
    );
  }

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new CircularProgressIndicator(),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, '/home');
      print(eventData.events);
    });
  }
}