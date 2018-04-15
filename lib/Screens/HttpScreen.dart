import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpScreen extends StatefulWidget{
  _HttpScreenState createState() => new _HttpScreenState();
}

class _HttpScreenState extends State<HttpScreen>{

  bool isFutureBuild = false;

  Future<Post> fetchPost() async {
    // Асинхронный запрос к серверу
    final response = await http.get('https://jsonplaceholder.typicode.com/posts/1');
    // raw -> json
    final responseJson = json.decode(response.body);
    // json -> object
    return new Post.fromJson(responseJson);
  }

  buildFuture(){
    return new FutureBuilder<Post>(
      future: fetchPost(),
      builder: (context, snapshot) {
        // Логика вывода контента
        if (snapshot.hasData) {
          return new Text(snapshot.data.title);
        } else if (snapshot.hasError) {
          return new Text("${snapshot.error}");
        }

        // Если не ошибка и нет данных, то выводим круглый индикатор
        return new CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    var appBar = new AppBar(title: new Text('HTTP'),leading: new Icon(Icons.message));

    var body = new Center(child: new Column(children: <Widget>[

      pad(new RaisedButton(
          child: new Text('Send request'),
          onPressed: () => setState((){ isFutureBuild = true; }))),
      pad(isFutureBuild ? buildFuture() : new Text('Nothing is here'))

    ]));

    return new Scaffold(appBar: appBar, body: body);
  }

  Widget pad(Widget child){
    return new Padding(child: child, padding: EdgeInsets.all(15.0));
  }

}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}