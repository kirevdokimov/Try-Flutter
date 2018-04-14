import 'package:flutter/material.dart';

// Stateless widgets are immutable, meaning that their properties can’t change—all values are final.
class HelloWorldApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'HelloWorldAppTitle',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Hello World App'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}