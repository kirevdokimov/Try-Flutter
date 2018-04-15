import 'package:flutter/material.dart';
import 'package:tryflutter/HelloWorldApp.dart';
import 'Screens/ChatScreen.dart';
import 'Screens/ChartScreen.dart';
import 'Screens/HttpScreen.dart';
import 'Notes/Animations.dart';


class RouterApp extends StatelessWidget {

  final ThemeData routerTheme = new ThemeData(
    primarySwatch: Colors.green,
    accentColor: Colors.greenAccent[400],
  );

  @override
  Widget build(BuildContext context){
    return new MaterialApp(
      title: 'Router',
      home: new _RouterContent(),
      theme: routerTheme,
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
      // Навигатор способен перейти как на новый App, так и просто на новый виджет.
      // В случае с переходом на App кнопки назад в AppBar не появляется. В случае
      // с виджетом появляется.
      new ListTile(title: new Text("Chat"),onTap: () => to(context,new ChatScreen())),
      new ListTile(title: new Text("HelloWorldApp"),onTap: () => to(context,new HelloWorldApp())),
      new ListTile(title: new Text("Just Scaffold"),onTap: () => to(context,new _JustScaffold())),
      new ListTile(title: new Text("Animations"),onTap: () => to(context,new AnimationScreen())),
      new ListTile(title: new Text("Charts"),onTap: () => to(context,new ChartScreen())),
      new ListTile(title: new Text("Http"),onTap: () => to(context,new HttpScreen())),
    ]);
  }
}

class _JustScaffold extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: new Text('Just Scaffold')));
  }

}
