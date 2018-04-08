import 'package:flutter/material.dart';

void main() => runApp(new MyApp(
      title: new Text('Building Dynamic Widgets'),
      someText: new Text('Hello Flutter'),
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
  List<String> textList = [];
  List<bool> checkList = [];

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
            ),
            new IconButton(
              icon: new Icon(Icons.remove),
              onPressed: () {
                for (int i = 0; i < textList.length; i++) {
                  if (checkList[i] == true) {
                    checkList.removeAt(i);
                    textList.removeAt(i);
                    i = -1;
                  }
                }
                setState(() {});
              },
            )
          ],
        ),
        body: new Column(
          children: <Widget>[
            widget.someText,
            showDialog == true
                ? new AlertDialog(
                    title: new Text('Commentt'),
                    content: new TextField(
                      decoration: new InputDecoration.collapsed(
                          hintText: 'Write Something'),
                      controller: edtController,
                      maxLines: 3,
                      onSubmitted: (String text) {},
                    ),
                    actions: <Widget>[
                      new FlatButton(
                        child: new Text('Ok'),
                        onPressed: () {
                          setState(() {
                            showDialog = false;
                            textList.add(edtController.text);
                            checkList.add(false);
                            edtController.clear();
                          });
                        },
                      )
                    ],
                  )
                : new Text(''),
            new Flexible(
              child: new ListView.builder(
                itemCount: textList.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Row(
                    children: <Widget>[
                      new Checkbox(
                          value: checkList[index],
                          onChanged: (bool newValue) {
                            checkList[index] = newValue;
                            setState(() {});
                          }),
                      new Text(textList[index]),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
