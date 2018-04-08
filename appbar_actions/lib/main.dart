import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(
        title: new Text('Appbar Actions'),
        someText: new Text('Some Text....'),
      ),
    ));

class MyApp extends StatefulWidget {
  final Widget title, someText;
  MyApp({this.title, this.someText});

  @override
  _MyAppState createState() => new _MyAppState();
}

enum TestEnum { A }

class _MyAppState extends State<MyApp> {
  String sText = "";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: widget.title,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add_comment),
            onPressed: () {
              setState(() {
                sText = "Committed";
              });
            },
          ),
          new IconButton(
            icon: new Icon(Icons.remove),
            onPressed: () {
              setState(() {
                sText = "Removed";
              });
            },
          ),
          new PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<TestEnum>>[
                new PopupMenuItem(
                  child: new FlatButton(
                    child: new Text('Click'),
                    onPressed: () {
                      setState(() {
                        sText = "Popup";
                      });
                    },
                  ),
                )
              ];
            },
          ),
        ],
      ),
      body: new Column(
        children: <Widget>[
          widget.someText,
          new Text('Message has been $sText')
        ],
      ),
    );
  }
}
