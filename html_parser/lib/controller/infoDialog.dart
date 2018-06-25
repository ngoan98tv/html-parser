import 'package:flutter/material.dart';
import 'package:html_parser/model/appInfo.dart';

Widget infoDialog(BuildContext context) {
  return new SimpleDialog(
    title: new Text('About ' + appName),
    children: <Widget>[
      new Container(
        padding: EdgeInsets.all(16.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text(appDescription, style: new TextStyle(height: 1.15),),
            new Text('Author: ' + author, style: new TextStyle(height: 1.15)),
            new Text('Build date: ' + foundation, style: new TextStyle(height: 1.15)),
            new Text('Opensourse copyright 2018 by MIT', style: new TextStyle(height: 1.15)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: new RaisedButton(
                  child: new Text('CLOSE'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}
