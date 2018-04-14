import 'package:flutter/material.dart'; // импорт этого пакета позволяет всему этому работать
import 'DefaultApp.dart';
import 'HelloWorldApp.dart';
import 'SimpleApp.dart';
import 'RandomWordsApp.dart';

//
// main() в main.dart - это entry point для всего приложения
//

var widget
//= new new DefaultApp();
//= new HelloWorldApp();
//= new SimpleApp();
= new RandomWordsApp();

void main() => runApp(widget);


