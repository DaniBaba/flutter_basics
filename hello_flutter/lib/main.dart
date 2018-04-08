import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  home: new MyApp(),
  theme: new ThemeData(
    primarySwatch: Colors.brown,
  ),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Directionality(
      textDirection: TextDirection.ltr,
      child: new Center(
        child: new Text('Hello Flutter'),
      ),
    );
  }
}