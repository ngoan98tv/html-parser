import 'package:flutter/material.dart';
import 'package:html_parser/controller/infoDialog.dart';
import 'package:html_parser/view/result.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final inputControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: new Text('HTML Parser App'),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.info_outline),
              onPressed: _showAppInfo,
            )
          ],
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Container(height: 16.0),
              new Text('Enter a web address to parse:',
                  style: new TextStyle(fontSize: 16.0)),
              new TextField(
                decoration: InputDecoration(hintText: 'http://example.com'),
                keyboardType: TextInputType.url,
                autofocus: true,
                controller: inputControll,
                onSubmitted: (url){
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Result(url: url)));
                },
              ),
              new Container(height: 25.0),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new OutlineButton(
                    child: new Text('http://'),
                    borderSide: BorderSide(color: Colors.green),
                    onPressed: () {
                      inputControll.text = 'http://';
                      // move cursor to end of text
                      inputControll.selection = TextSelection.fromPosition(
                          new TextPosition(offset: inputControll.text.length));
                    },
                  ),
                  new Container(width: 6.0),
                  new OutlineButton(
                    child: new Text('CLEAR'),
                    borderSide: BorderSide(color: Colors.green),
                    onPressed: () {
                      inputControll.text = '';
                    },
                  ),
                  new Container(width: 6.0),
                  new RaisedButton(
                    child: new Text('DONE'),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Result(url: inputControll.text)));
                    },
                  )
                ],
              ),
            ],
          ),
        ));
  }

  void _showAppInfo() {
    showDialog(
        context: context,
        builder: (context) {
          return infoDialog(context);
        });
  }
}
