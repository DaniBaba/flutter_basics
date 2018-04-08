import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
      title: new Text('Dynamic Widgets Display'),
      someText: new Text('Some Text....'),
    ));

class MyApp extends StatefulWidget {
  final Widget title, someText;
  MyApp({this.title, this.someText});

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController edtController = new TextEditingController();
  bool showDialog = false;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: widget.title,
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.add_comment),
              onPressed: () {
                setState(() {
                  showDialog = true;
                });
              },
            )
          ],
        ),
        body: new Column(
          children: <Widget>[
            widget.someText,
            showDialog == true
                ? new AlertDialog(
                    title: new Text('Comment'),
                    content: new TextField(
                      decoration: new InputDecoration.collapsed(hintText: 'Write Something'),
                      controller: edtController,
                      maxLines: 3,
                      onSubmitted: (String text){

                      },
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('Ok'),
                        onPressed: () {
                          setState(() {
                            showDialog = false;
                            edtController.clear();
                          });
                        },
                      )
                    ],
                  )
                : new Text(''),
          ],
        ),
      ),
    );
  }
}
