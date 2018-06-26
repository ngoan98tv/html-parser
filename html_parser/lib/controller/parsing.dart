import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html_parser/model/html.dart';

Future<http.Response> fetch(String url) async {
  final response = await http.get(url);

  return response;
}

class Parsing extends StatefulWidget {
  Parsing({Key key, this.url}) : super(key: key);

  final url;

  @override
  _ParsingState createState() => _ParsingState();
}

class _ParsingState extends State<Parsing> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: fetch(widget.url),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return new Text('No connection.');
          case ConnectionState.waiting:
            return new LinearProgressIndicator();
          default:
            if (snapshot.hasError)
              return new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(height: 100.0,),
                  new Icon(Icons.warning, size: 68.0, color: Colors.red),
                  new Text(
                    'Error: ${snapshot.error}',
                    style: new TextStyle(color: Colors.redAccent),
                  ),
                  new Container(height: 100.0,),
                  new RaisedButton(
                    child: new Text('TRY AGAIN'),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            else
              return new TabBarView(
                children: <Widget>[
                  new ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[linksRender(snapshot.data.body)],
                  ),
                  new ListView(
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[headersRender(snapshot.data.headers)],
                  ),
                  new ListView(
                    padding: EdgeInsets.all(16.0),
                    children: <Widget>[new Text(snapshot.data.body)],
                  )
                ],
              );
        }
      },
    );
  }

  Widget headersRender(Map<String, String> headers) {
    List list = new List<Widget>();

    headers.forEach((key, value) {
      list.add(new Text('$key : $value'));
    });

    return new Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget linksRender(String html) {
    List list = new List<Widget>();

    getDocument(html).forEach((key, value) {
      list.add(new ListTile(
        title: new Text(
          '$key',
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: new Text('$value', overflow: TextOverflow.ellipsis),
        trailing: new Icon(Icons.navigate_next),
        onTap: () {
          showDialog(
            context: context,
            child: new SimpleDialog(
              title: new Text('$key', overflow: TextOverflow.clip),
              children: <Widget>[new Text('$value')],
            ),
          );
        },
      ));
    });

    return new Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
