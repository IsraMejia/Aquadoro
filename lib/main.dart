import 'package:aquadoro/goals_page.dart';
import 'package:aquadoro/splash.dart';
import 'package:aquadoro/splash_screen.dart';
import 'package:flutter/material.dart';
 
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
        'splashScreen' : (BuildContext context) => SplashScreen(),
        'goalsPage'    : (BuildContext context) => GoalsPage(),
        'splash'       : (BuildContext context) => Splash(),
      },
      initialRoute: 'splashScreen',
    );
  }
}