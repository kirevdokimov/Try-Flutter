import 'package:flutter/material.dart';

// Виджеты можно создавать напрямую через new, либо оборачивая в Widget.
// Обертка позволяет получить контекст непосредственно в build(...)

class WidgetOrGetter extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Router'),
        ),
        //body: getRaisedButton(),
        body : new _RaisedButtonWidget()
      )
    );
  }

  /* Кнопку можно напрямую создавать при вызове геттера, но без непосредственного контекста.
  * Его, вероятно, можно получить другими способами (Scaffold.of(), например)*/
  getRaisedButton(){
    return new RaisedButton(child: new Text("ButtonGetter"),textTheme: ButtonTextTheme.primary);
  }

}
/* Кнопку можно поместить в обертку - виджет, тогда передается ещё и контекст в build(...)
* Полагаю, что это контекст контейнера, в котором будет находиться обертка */
class _RaisedButtonWidget extends StatelessWidget{
  // underscore перед названием делает поле или класс или метод приватным
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(child: new Text("ButtonWidget"),textTheme: ButtonTextTheme.primary,);
  }

}