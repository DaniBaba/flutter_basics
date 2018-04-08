import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          title: new Text('Flutter Tab Application'),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.first_page)),
              new Tab(text: 'Second Tab'),
            ],
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Text('First Tab View'),
            new SecondWidget(),
          ],
        )
      ),
    ));
  }
}

class SecondWidget extends StatefulWidget {
  _SecondWidgetState createState() => new _SecondWidgetState();
}

class _SecondWidgetState extends State<SecondWidget> {
  int counter = 0;
  bool chkValue = false;
  
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text('Counter Value = $counter'),
        new Checkbox(
          value: chkValue,
          onChanged: (bool newValue){
            setState((){
              counter++;
              chkValue = newValue;
            });
          },
        )
      ],
    );
  }
}

/* 
DefaultTabController automatic assign First Tab = First Child &
Second Tab = Second Child of "TabBarView".

When we click the Tab it will Reinitialize of its children whether its Stateless or Statefull. 
*/