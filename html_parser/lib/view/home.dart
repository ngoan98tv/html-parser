import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('HTML Parser App'),
      ),
      body: new Center(
        child: new Text('Welcome to Flutter app!')
      ),
    );
  }

}