import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class RandomWordsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'RandomWordsAppTitle',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Random Words App'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}

//Stateful widgets maintain state that might change during the lifetime of the widget.
//StatefulWidget сам по себе immutable, но благодаря вложенному State отображаемые данные могут изменяться
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}