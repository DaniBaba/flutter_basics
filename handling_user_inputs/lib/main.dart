import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
      title: new Text('Handling User Inputs'),
      someText: new Text('Some Text....'),
    ));

class MyApp extends StatefulWidget {
  final Widget title, someText;
  MyApp({this.title, this.someText});

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sText = "";
  TextEditingController edtController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(title: widget.title),
        body: new Column(
          children: <Widget>[
            widget.someText,
            new TextField(
              decoration: new InputDecoration(hintText: "Write Something"),
              controller: edtController,
              onChanged: (String text) {
                setState(() {
                  //sText = text;
                });
              },
              onSubmitted: (String text) {
                 setState(() {
                  //sText = text;
                  sText = edtController.text;
                  edtController.clear();
                });
              },
            ),
            new Text(sText),
          ],
        ),
      ),
    );
  }
}
