import 'package:flutter/material.dart';

void main() => runApp(new PackingList());

class PackingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Demo',
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: new ListPage(title: 'Packing Lists'),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 1.0,
      backgroundColor: Color.fromRGBO(8, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 66, 86, 1.0),
      appBar: topAppBar,
    );
  }
}
