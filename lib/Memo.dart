import 'package:flutter/material.dart';

void main() => runApp(new Memo());

class Memo extends StatelessWidget {
//  MaterialColor themeColor = Colors.pink[300];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "备忘录",
      theme: ThemeData(primarySwatch: Colors.pink),
      home: MemoPage(title: "满满的备忘录"),
    );
  }
}

class MemoPage extends StatefulWidget {
  final String title;

  MemoPage({Key key, this.title}) : super(key: key);

  @override
  MemoPageState createState() => new MemoPageState();
}

class MemoPageState extends State<MemoPage> {
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    widgets.add(getRow(0));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: new ListView(children: widgets),
    );
  }

  Widget getRow(final int i) {
    final TextEditingController mController = new TextEditingController();
    Widget widget;
    widget = new GestureDetector(
      child: new Row(
        children: <Widget>[
          new Expanded(
            flex: 5,
            child: new Padding(
              padding: EdgeInsets.all(10.0),
              child: new TextField(
                  controller: mController,
                  decoration: new InputDecoration(hintText: "请老婆输入备忘内容")),
            ),
          ),
          new Expanded(
              flex: 1,
              child: new GestureDetector(
                child: new Icon(Icons.remove_circle, color: Colors.pink[300]),
                onTap: () {
                  if (widgets.length > 1) {
                    setState(() {
                      widgets = new List.from(widgets);
                      widgets.remove(widget);
                      print("remove $this");
                    });
                  }
                },
              ))
        ],
      ),
    );

    mController.addListener(() {
      final text = mController.text.toLowerCase();
      if (text.isNotEmpty) {
        if (widgets.indexOf(widget) == widgets.length - 1) {
          setState(() {
            widgets = new List.from(widgets);
            widgets.add(getRow(widgets.length));
            print("row $i");
          });
        }
      } else {}
    });

    return widget;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
