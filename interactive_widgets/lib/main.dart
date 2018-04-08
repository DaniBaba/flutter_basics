import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: new MyApp(
        title: new Text('My App'),
        someText: new Text('Some Text'),
      ),
      theme: new ThemeData(
        primarySwatch: Colors.brown,
      ),
    ));

class MyApp extends StatelessWidget {
  final Widget title, someText;
  int iCounter = 0;
  bool chkValue = false;

  MyApp({this.title, this.someText});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: this.title,
      ),
      body: new Column(
        children: <Widget>[
          this.someText,
          new Text('Counter Value is $iCounter'),
          new FlatButton(
            child: new Text('Click me for Increament'),
            onPressed: () {
              iCounter++;
            },
          ),
          new Checkbox(
            value: chkValue,
            onChanged: (bool value) {
              chkValue = value;
            },
          )
        ],
      ),
    );
  }
}

/*
Stateless widget does not redraw the widgets its mean if anything updated it will not apply in stateless Widget
because it has no state. Stateless widgets as like the fixed widgets which can not be changed on run time. 
It draws only on run time.
*/