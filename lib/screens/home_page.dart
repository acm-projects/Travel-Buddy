import 'package:flutter/material.dart';
import 'package:travelbuddyapp/screens/authentication.dart';
import 'package:travelbuddyapp/database/todo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> _todoList;

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _textEditingController = TextEditingController();
  StreamSubscription<Event> _onTodoAddedSubscription;
  StreamSubscription<Event> _onTodoChangedSubscription;

  Query _todoQuery;

  //bool _isEmailVerified = false;

  @override
  void initState() {
    super.initState();

    //_checkEmailVerification();

    _todoList = new List();
    _todoQuery = _database
        .reference()
        .child("todo")
        .orderByChild("userId")
        .equalTo(widget.userId);
    _onTodoAddedSubscription = _todoQuery.onChildAdded.listen(onEntryAdded);
    _onTodoChangedSubscription =
        _todoQuery.onChildChanged.listen(onEntryChanged);
  }

//  void _checkEmailVerification() async {
//    _isEmailVerified = await widget.auth.isEmailVerified();
//    if (!_isEmailVerified) {
//      _showVerifyEmailDialog();
//    }
//  }

//  void _resentVerifyEmail(){
//    widget.auth.sendEmailVerification();
//    _showVerifyEmailSentDialog();
//  }

//  void _showVerifyEmailDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content: new Text("Please verify account in the link sent to email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Resent link"),
//              onPressed: () {
//                Navigator.of(context).pop();
//                _resentVerifyEmail();
//              },
//            ),
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content: new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

  @override
  void dispose() {
    _onTodoAddedSubscription.cancel();
    _onTodoChangedSubscription.cancel();
    super.dispose();
  }

  onEntryChanged(Event event) {
    var oldEntry = _todoList.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });

    setState(() {
      _todoList[_todoList.indexOf(oldEntry)] =
          Todo.fromSnapshot(event.snapshot);
    });
  }

  onEntryAdded(Event event) {
    setState(() {
      _todoList.add(Todo.fromSnapshot(event.snapshot));
    });
  }

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  addNewTodo(String todoItem) {
    if (todoItem.length > 0) {
      Todo todo = new Todo(todoItem.toString(), widget.userId, false);
      _database.reference().child("todo").push().set(todo.toJson());
    }
  }

  updateTodo(Todo todo) {
    //Toggle checked
    todo.isChecked = !todo.isChecked;
    if (todo != null) {
      _database.reference().child("todo").child(todo.key).set(todo.toJson());
    }
  }

  deleteTodo(String todoId, int index) {
    _database.reference().child("todo").child(todoId).remove().then((_) {
      print("Delete $todoId successful");
      setState(() {
        _todoList.removeAt(index);
      });
    });
  }

  showAddTodoDialog(BuildContext context) async {
    _textEditingController.clear();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Row(
              children: <Widget>[
                new Expanded(
                    child: new TextField(
                      controller: _textEditingController,
                      autofocus: true,
                      decoration: new InputDecoration(
                        labelText: 'Add new todo',
                      ),
                    ))
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Save'),
                  onPressed: () {
                    addNewTodo(_textEditingController.text.toString());
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  Widget showTodoList() {
    if (_todoList.length > 0) {
      return ListView.builder(
          shrinkWrap: true,
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) {
            String todoId = _todoList[index].key;
            String subject = _todoList[index].subject;
            bool isChecked = _todoList[index].isChecked;
            String userId = _todoList[index].userId;
            return Dismissible(
              key: Key(todoId),
              background: Container(color: Colors.red),
              onDismissed: (direction) async {
                deleteTodo(todoId, index);
              },
              child: ListTile(
                title: Text(
                  subject,
                  style: TextStyle(fontSize: 20.0),
                ),
                //
                trailing: IconButton(
                    icon: (isChecked)
                        ? Icon(
                      Icons.done_outline,
                      color: Colors.green,
                      size: 20.0,
                    )
                        : Icon(Icons.done, color: Colors.grey, size: 20.0),
                    onPressed: () {
                      updateTodo(_todoList[index]);
                    }),
              ),
            );
          });
    } else {
      return Center(
          child: Text(
            "Please choose what you'd like to pack\n\n"
            "Packing List:\n"
                "Etc.",
            //textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter login demo'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body: showTodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddTodoDialog(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ));
  }
}

/*
class HomePage extends StatelessWidget {

  class LoginPage extends StatefulWidget{
  LoginPage({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  @override
  _LoginPageState createState() => _LoginPageState();
  }

  class _LoginPageState extends State<LoginPage>{
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading;

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

  // from here down is where the UI needs to be tweaked (copied from tutorial
  Widget _showCircularProgress() {
  if (_isLoading) {
  return Center(child: CircularProgressIndicator());
  }
  return Container(
  height: 0.0,
  width: 0.0,
  );
  }

//  void _showVerifyEmailSentDialog() {
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        // return object of type Dialog
//        return AlertDialog(
//          title: new Text("Verify your account"),
//          content:
//              new Text("Link to verify account has been sent to your email"),
//          actions: <Widget>[
//            new FlatButton(
//              child: new Text("Dismiss"),
//              onPressed: () {
//                toggleFormMode();
//                Navigator.of(context).pop();
//              },
//            ),
//          ],
//        );
//      },
//    );
//  }

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
  padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
  child: CircleAvatar(
  backgroundColor: Colors.transparent,
  radius: 48.0,
  child: Image.asset('assets/flutter-icon.png'),
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
  color: Colors.blue,
  child: new Text(_isLoginForm ? 'Login' : 'Create account',
  style: new TextStyle(fontSize: 20.0, color: Colors.white)),
  onPressed: validateAndSubmit,
  ),
  ));
  }
*/
