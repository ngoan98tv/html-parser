import 'package:flutter/material.dart';
import 'package:html_parser/controller/infoDialog.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              new TextField(
                decoration: InputDecoration(
                  hintText: 'Enter an URL to parse'
                ),
                autofocus: true,
                
              )
            ],
          ),
        ));
  }

  void _showAppInfo() {
    showDialog(
      context: context,
      builder: (context){
        return infoDialog(context);
      }
    );
  }
}
