
import 'package:flutter/material.dart';
import 'package:aquadoro/goals_page.dart'; 
import 'package:aquadoro/pantalla_carga.dart';
//import 'package:aquadoro/aquadoro.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.blue[800],
      ),
      routes: {      
        'goalsPage'       : (BuildContext context) => GoalsPage(), 
        'pantallaDeCarga' : (BuildContext context) => PantallaDeCarga(), 
        //'aquadoro'        : (BuildContext context) => Aquadoro(), 
        //Ya no es necesario ya que se muestra la otra manera de mandar la ruta , 
 
      },
      
      initialRoute: 'pantallaDeCarga',
    );
  }
}

