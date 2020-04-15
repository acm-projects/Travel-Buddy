import 'package:flutter/material.dart';
import 'package:travelbuddyapp/screens/authentication.dart';

class LoginPage extends StatefulWidget{
  LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  //bool _hideText = true;
  bool _isLoginForm;
  bool _isLoading;

  /*final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }*/
  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        if (_isLoginForm) {
          userId = await widget.auth.signIn(_email, _password);
          print('Signed in: $userId');
        } else {
          userId = await widget.auth.signUp(_email, _password);
          //widget.auth.sendEmailVerification();
          //_showVerifyEmailSentDialog();
          print('Signed up user: $userId');
        }
        setState(() {
          _isLoading = false;
        });

        if (userId.length > 0 && userId != null && _isLoginForm) {
          widget.loginCallback();
        }
      } catch (e) {
        print('Error: $e');
        setState(() {
          _isLoading = false;
          _errorMessage = e.message;
          _formKey.currentState.reset();
        });
      }
    }
  }

  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
  }

  // ui is below

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background.jpg"),
              fit: BoxFit.cover,
            ),
        ),
            padding: EdgeInsets.only(top: 30, right: 50.0, left: 50.0, bottom: 75.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            /*Image.asset('images/tblogo.png'),
            SizedBox(height: 30.0,),*/
            SizedBox(height: 55.0,),
            new Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            ),
        child: Stack(
          children: <Widget>[
            _showForm(),
            _showCircularProgress(),
          ],
        ),
      ),
    ],),
      ),
      ),
    );
  }

  /*Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
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
                  SizedBox(height: 35.0,),
                  SizedBox(height: 35.0,),
                  new Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
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
                  buildButtonContainer(),
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
      ),
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

  Widget buildButtonContainer(){
    return Container(
      child: new FlatButton(
        onPressed: () {
          print("Email: " + emailController.text);
          print("Password: " + passwordController.text);
          emailController.clear();
          passwordController.clear();
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
}*/

/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
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
                  SizedBox(height: 35.0,),
                  SizedBox(height: 35.0,),
                  new Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: <Widget>[
                        Text("Email"),
                        SizedBox(height: 5.0,),
                        Text("Password"),
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
                  buildButtonContainer(),
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
      ),
    );
  }

  void _toggle() {
    setState(() {
      _hideText = !_hideText;
    });
  }
*/




  Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }



  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showLogo(),
              showEmailInput(),
              showPasswordInput(),
              showPrimaryButton(),
              showSecondaryButton(),
              showErrorMessage(),
            ],
          ),
        ));
  }

  Widget showErrorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('images/tblogo.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }

  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Colors.grey,
            )),
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            _isLoginForm ? 'Create an account' : 'Have an account? Sign in',
            style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
        onPressed: toggleFormMode);
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.cyan[800],
            child: new Text(_isLoginForm ? 'Login' : 'Create account',
                style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: validateAndSubmit,
          ),
        ));
  }
}