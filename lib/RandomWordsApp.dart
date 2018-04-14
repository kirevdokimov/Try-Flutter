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

  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions()
    => new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
    );


  Widget _buildRow(WordPair pair)
    => new ListTile(title: new Text(pair.asPascalCase, style: _biggerFont));


  
}