import 'package:flutter/material.dart';
import 'package:tryflutter/HelloWorldApp.dart';

class RouterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Router',
      home: new RouterContent()
    );
  }
}

class RouterContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Router'),
        ),

        body: new RaisedButton(
          /*  Если использовать контекст RouterApp, то пишет,
              что нет навигатора в этом контексте.
              Предполагаю, что внешний контекст не имеет понятия
              о существовании App и поэтому о навигаторе тоже */
          onPressed: () => Navigator.of(context).push(
            new MaterialPageRoute(builder: (ctx) => new HelloWorldApp())
          )
        )
    );
  }
}