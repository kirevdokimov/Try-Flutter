import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new _State();
}

class _State extends State<ChatScreen> {

  // Эта байда нужна для работы с TextField
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("Friendlychat")
      ),
      body: _buildTextComposer(),
    );
  }

  // Возвращает настроеный TextField с привязкой к контроллеру
  Widget _buildTextComposer() {

    // Поле для ввода текста
    var textfield = new TextField(
      controller: _textController,
      onSubmitted: _handleSubmitted,
      decoration: new InputDecoration.collapsed(hintText: "Send a message"),
    );

    //Кнопка для отправки
    var button = new Container(
      margin: new EdgeInsets.symmetric(horizontal: 4.0),
      child: new IconButton(
          icon: new Icon(Icons.send),
          onPressed: () => _handleSubmitted(_textController.text)),
    );

    var container = new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      // Пичкаем Row полем и кнопкой
      child: new Row(
        children: <Widget>[
          new Flexible(child: textfield),
          button
        ]
      )
    );

    // Контейнер оборачиваем в виджет-тему
    return new IconTheme(                                            //new
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: container,
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
  }
}