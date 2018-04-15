import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesScreen extends StatefulWidget{

  _State createState() => new _State();

}

class _State extends State<SharedPreferencesScreen>{

  // Запрашиваем SharedPreferences и получаем Future
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // т.к доступ к Future<SharedPreferences> асинхронный, то и переменная,
  // получаемая оттуда и записываемая туда ожидается быть асинхронной
  Future<int> _counter;

  // async ждет завершения кода внутри и только тогда продолжает ход программы
  Future<Null> _incrementCounter() async {
    // await ждет, когда Future посчитается и тогда продолжает ход программы
    // Ждем получения SharedPreferences
    final SharedPreferences prefs = await _prefs;
    // Получаем предыдущее значение и прибавляем единицу
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    // Тут, например, можно заставить подождать несколько секунд
	  await new Future.delayed(const Duration(seconds : 1));

    setState(() {
      // внешней переменной устанавливаем новое значение только после успешной записи оного в SharedPreferences
      // т.е вернет Future, поэтому и тип задали именно такой

      _counter = prefs.setInt("counter", counter).then((b) => counter);
    });
  }

  @override
  Widget build(BuildContext context) {

    var wrap = (List<Widget> w) => new Center(
            child : Padding(
                    child: Column(children: w),
                    padding: EdgeInsets.all(32.0)));

    // Вместо непосредственно значения мы имеет Future, поэтому с ним и работаем
    var counterText = new FutureBuilder<int>(
            future: _counter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              //Состояние асинхронного вычисления
              switch (snapshot.connectionState) {
                // Судя по вызову print состояние waiting вызывается непосредственно перез изменением _counter,
                // в моем случае всего один раз, поэтому индикатор не успевает появиться
                case ConnectionState.waiting:
                  print('Waiting');
                  return const CircularProgressIndicator();
                default:
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  else
                    return new Text(
                      'Button tapped ${snapshot.data} time${ snapshot.data == 1 ? '' : 's' }.\n\n'
                              'This should persist across restarts.',
                    );
              }
            });

    var button = new RaisedButton(
      onPressed: _incrementCounter,
      child: new Text('Increment Counter'),
    );

    return new Scaffold(
      appBar: new AppBar(title: new Text('SharedPreferences'),),
      body: wrap(<Widget>[button,counterText])
    );
  }
}