import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  bool _hideText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 35, right: 50.0, left: 50.0, bottom: 0),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomPadding: true,
            body: new Container(
                child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset('images/tblogo.png'),
                            SizedBox(height: 35.0,),
                            SizedBox(height: 35.0,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white38,
                              ),
                              child: Column(
                                children: <Widget>[
                                  buildTextField("Email"),
                                  SizedBox(height: 5.0,),
                                  buildTextField("Password"),
                                ],),
                            ),
                            Container(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    new FlatButton(
                                        onPressed: (){
                                          print("Forgotten Password?");
                                        },
                                        child: Text("Forgotten Password?", style: TextStyle(color: Colors.black)
                                        )
                                    ),
                                  ]
                              ),
                            ),
                            SizedBox(height: 25.0,),
                            loginButtonContainer(),
                            SizedBox(height: 10.0,),
                            Container(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new FlatButton(
                                        onPressed: (){
                                          print("Don't have an account?");
                                        },
                                        child: Text("Don't have an account?", style: TextStyle(color: Colors.black)
                                        )
                                    ),
                                    SizedBox(width: 10.0,),
                                    new FlatButton(
                                        onPressed: (){
                                          print('Sign Up');
                                        },
                                        child: Text("SIGN UP", style: TextStyle(color: Colors.black)
                                        )
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ]
                      ),
                    )
                )
            )
        )
    );
  }

  void _toggle() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  Widget buildTextField(String fieldName){
    return TextField(
      controller: fieldName == "Password" ? passwordController : emailController,
      textInputAction: fieldName != "Password" ? TextInputAction.next : TextInputAction.done,
      onSubmitted: (_) => {
        if (fieldName == "Email") {
          FocusScope.of(context).nextFocus()
        } else {
          FocusScope.of(context).unfocus(),
          _onLoading()
        }
      },
      obscureText: _hideText && fieldName == "Password" ? true : false,
      decoration: InputDecoration(
          labelText: fieldName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          focusColor: Colors.white12,
          prefixIcon: fieldName == "Email" ? Icon(Icons.email): Icon(Icons.lock),
          suffixIcon: fieldName == "Password" ? IconButton(
            onPressed: (){
              _toggle();
            },
            icon: Icon(!_hideText ? Icons.visibility : Icons.visibility_off),
          ): null
      ),
    );
  }

  submitText() {
    print("Email: " + emailController.text);
    print("Password: " + passwordController.text);
    emailController.clear();
    passwordController.clear();
    // Navigator.pushReplacementNamed(context, '/home');
  }

  Widget loginButtonContainer(){
    return Container(
      child: new FlatButton(
        onPressed: () {
          _onLoading();
          // submitText();
          // Navigator.pushReplacementNamed(context, '/home');
        },
        child: new Text('LOGIN',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
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
              // new Text("Loading"),
            ],
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
      submitText();
    });
  }
}

