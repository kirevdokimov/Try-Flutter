import 'package:flutter/material.dart'; // импорт этого пакета позволяет всему этому работать
import 'DefaultApp.dart';
import 'HelloWorldApp.dart';
import 'SimpleApp.dart';

//
// main() в main.dart - это entry point для всего приложения
//

var widget
//= new new DefaultApp();
//= new HelloWorldApp();
= new SimpleApp();

void main() => runApp(widget);


