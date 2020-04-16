import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'checklist-page.dart';
void main() => runApp(new PackingList());

class PackingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Demo',
      theme: new ThemeData(primaryColor: Color.fromRGBO(57, 66, 86, 1.0)),
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
  List packingListTiles;

  @override
  void initState() {
    // TODO: implement initState
    packingListTiles = getPackingListTiles();
    super.initState();
  }

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

    ListTile makeListTile(PackingListTiles packingListTiles) => ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(width: 1.0, color: Colors.white24))),
            child: Icon(Icons.autorenew, color: Colors.white),
          ),
          title: Text(
            packingListTiles.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing:
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
/*                  onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Checklist()));
          },*/
        );


    Card makeCard(PackingListTiles packingListTiles) => Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .5)),
            child: makeListTile(packingListTiles),
          ),
        );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: packingListTiles.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(packingListTiles[index]);
        },
      ),
    );

    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 66, 86, 1.0),
      body: makeBody,
      appBar: topAppBar,
    );
  }
}

class PackingListTiles {
  String title;
  PackingListTiles({this.title});
}

List getPackingListTiles() {
  return [
    PackingListTiles(title: "Tolietries"),
    PackingListTiles(title: "Carry-On"),
    PackingListTiles(title: "First Aid"),
    PackingListTiles(title: "Infant"),
    PackingListTiles(title: "Cruise"),
    PackingListTiles(title: "Technology"),
    PackingListTiles(title: "Other"),

  ];
}
