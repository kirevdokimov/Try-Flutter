import 'package:flutter/material.dart'; // импорт этого пакета позволяет всему этому работать
import 'DefaultApp.dart';
import 'HelloWorldApp.dart';
import 'SimpleApp.dart';
import 'RandomWordsApp.dart';
import 'RouterApp.dart';
import 'NavigationChamber.dart';
import 'Notes/WidgetOrGetter.dart';

//
// main() в main.dart - это entry point для всего приложения
//

var widget
//= new new DefaultApp();
//= new HelloWorldApp();
//= new SimpleApp();
= new RouterApp();

void main() => runApp(widget);


