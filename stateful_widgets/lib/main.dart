import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      title: 'Stateful Widgets',
      home: new MyApp(
        title: new Text('My App'),
        someText: new Text('some text'),
      ),
    ));

class MyApp extends StatefulWidget {
  final Widget title, someText;

  MyApp({this.title, this.someText});

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  bool chkValue = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: widget.title,
      ),
      body: new Column(
        children: <Widget>[
          widget.someText,
          new FlatButton(
            child: new Text('Button counter is $counter'),
            onPressed: () {
              setState(() {
                counter++;
                chkValue = !chkValue;
              });
            },
          ),
          new Checkbox(
            value: chkValue,
            onChanged: (bool value) {
              setState(() {
                counter++;
                chkValue = value;
              });
            },
          )
        ],
      ),
    );
  }
}
