import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:manman_memo/model/weather.dart';
import 'package:manman_memo/network/http_controller.dart';
import 'manager/weather_manager.dart';
import 'memo.dart';
import 'game.dart';

void main() => runApp(new ManmanMain());

class ManmanMain extends StatelessWidget {
//  MaterialColor themeColor = Colors.pink[300];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "满满",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MainPage(title: "贴心老公"),
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
  WeatherManager mWeatherManager =  WeatherManager();
  String weather;

  @override
  void initState() {
    super.initState();
    var map = new Map<String, String>();
    map["city"] = "上海";
    map["key"] = "dd1b2fbe2610bb4acb3a7a065697a7c0";
    HttpController.get("http://apis.juhe.cn/simpleWeather/query", map,
        callBack: (response) {
      Weather weatherModel = Weather.fromJson(response);
      setState(() {
        weather = mWeatherManager.getFutureWeather( weatherModel.result);
      });
      print("jason," + response.toString());
    }, errorCallBack: (error) {
      print("jason," + error);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("天气预报\n$weather"),
          RaisedButton(
              child: Text("老婆的备忘录"),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new Memo()),
                );
              }),
          RaisedButton(
              child: Text("老婆的小游戏"),
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
