import 'package:flutter/material.dart';

const String _name = "John Doe";

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new _State();
}

class _State extends State<ChatScreen> {

  final List<ChatMessage> _messages = <ChatMessage>[];


  // Эта байда нужна для работы с TextField
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new Column(
        children: <Widget>[
          //Список из сообщений
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          // Разделитель
          new Divider(height: 1.0),
          // Контейнер поля ввода
          new Container(
            decoration: new BoxDecoration(
                color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
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
    ChatMessage message = new ChatMessage(text: text);
    //Делаем изменения внутри setState, чтобы уведомить widget об изменениях для rebuild
    // Вообще можно вызывать и после изменений, но рекомендуется внутри
    setState(() {_messages.insert(0, message);});
  }
}



class ChatMessage extends StatelessWidget {
  ChatMessage({this.text}); // Конструктор
  final String text;
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(_name[0])),
          ),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Text(_name, style: Theme.of(context).textTheme.subhead),
              new Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: new Text(text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}