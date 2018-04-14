import 'package:flutter/material.dart';
import 'package:tryflutter/HelloWorldApp.dart';

class RouterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Router',
      home: new _RouterContent()
    );
  }
}

class _RouterContent extends StatelessWidget{
  @override
  Widget build(BuildContext context /* Контекст MaterialApp */) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Router'),
        ),

        body: new _ListOfRoutes()

        );
  }

  getButton(BuildContext ctx) => new RaisedButton(onPressed: () => Navigator.of(ctx).push(
    new MaterialPageRoute(builder: (ctx) => new HelloWorldApp())));

}

class _ListOfRoutes extends StatelessWidget{

  to(BuildContext ctx, Widget w) => Navigator.of(ctx).push(
      new MaterialPageRoute(builder: (ctx) => w));

  @override
  Widget build(BuildContext context) {
    return new ListView(children: <Widget>[
      new ListTile(title: new Text("One"),onTap: () => to(context,new HelloWorldApp())),
      new ListTile(title: new Text("Two"),onTap: () => to(context,new HelloWorldApp()))
    ]);
  }


}
