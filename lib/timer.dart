import 'package:flutter/material.dart';
import 'dart:async';

class TimerPage extends StatefulWidget {
  TimerPage({Key key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  
  //Declaracion de variables 
  
  int _contador = 10;
  Timer _timer;



  @override
  Widget build(BuildContext context) {

  
    return Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             (_contador>0)? Text(""): Text('Listo'),
             Text('$_contador'),
             RaisedButton(onPressed: _startTimer,
             child: Text('Iniciar'),),


           ],
           ),
       ),
    );
  }

  void _startTimer(){
    _contador = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if(_contador>0){
          _contador--;
        }else{
          _timer.cancel();
        }
      });
     });
  }
}
