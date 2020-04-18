import 'package:flutter/material.dart';
//import 'package:travelbuddyapp/screens/home_page.dart';
import 'package:travelbuddyapp/screens/packinglist.dart';
import 'package:travelbuddyapp/screens/authentication.dart';
import 'package:travelbuddyapp/screens/login_signup_page.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";

@override
void initState() {
  super.initState();
  widget.auth.getCurrentUser().then((user) {
    setState(() {
      if (user != null) {
        _userId = user?.uid;
      }
      authStatus =
      user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
    });
  });
}

void loginCallback() {
  widget.auth.getCurrentUser().then((user) {
    setState(() {
      _userId = user.uid.toString();
    });
  });
  setState(() {
    authStatus = AuthStatus.LOGGED_IN;
  });
}

void logoutCallback() {
  setState(() {
    authStatus = AuthStatus.NOT_LOGGED_IN;
    _userId = "";
  });
}

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  switch (authStatus) {
    case AuthStatus.NOT_DETERMINED:
      return buildWaitingScreen();
      break;
    case AuthStatus.NOT_LOGGED_IN:
      return new LoginPage(
        auth: widget.auth,
        loginCallback: loginCallback,
      );
      break;
    case AuthStatus.LOGGED_IN:
      if (_userId.length > 0 && _userId != null) {
        // Code not compatible with packinglist.dart - NR
        return new ListPage(
          title: 'Packing Lists');
          /*userId: _userId,
          auth: widget.auth,
          logoutCallback: logoutCallback,*/
      } else
        return buildWaitingScreen();
      break;
    default:
      return buildWaitingScreen();
  }
}
}