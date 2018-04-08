import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(
        firstLine: new Text('First Line of Widget'),
        secondLine: new Text('Second Line of Widget'),
      ),
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
    ));

class MyApp extends StatelessWidget {
  final Widget firstLine, secondLine;

  MyApp({this.firstLine, this.secondLine});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My App'),
      ),
      body: new Column(
        children: <Widget>[
          this.firstLine,
          this.secondLine,
        ],
      ),
    );
  }
}
