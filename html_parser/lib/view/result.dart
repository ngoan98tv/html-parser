import 'package:flutter/material.dart';
import 'package:html_parser/controller/parsing.dart';

class Result extends StatefulWidget {
  
  Result({Key key, this.url}) : super(key: key);

  final url;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            title: new ListTile(
              title: new Text('Result for parsing'),
              subtitle: new Text(widget.url),
            ),
            bottom: TabBar(
          tabs: <Widget>[
            Tab(text: 'Menu'),
            Tab(text: 'Headers'),
            Tab(text: 'HTML')
          ],
        )),
        body: Parsing(url: widget.url)
      ),
    );
  }
}
