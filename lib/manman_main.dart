import 'package:flutter/material.dart';
import 'Memo.dart';
import 'Game.dart';

void main() => runApp(new ManmanMain());

class ManmanMain extends StatelessWidget {
//  MaterialColor themeColor = Colors.pink[300];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "满满",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MainPage(title: "满满的app"),
    );
  }
}

class MainPage extends StatefulWidget {
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  State createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
              child: Text("备忘录"),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Memo()),
                );
              }),
          RaisedButton(
              child: Text("小游戏"),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Game()),
                );
              }),
        ],
      )),
    );
  }
}
