import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';

class TimerHomePage extends StatefulWidget {
  TimerHomePage({Key key}) : super(key: key);

  @override
  _TimerHomePageState createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {

  //declaracion de variables

//Variables para contador principal
  int horas = 0;
  int minutos = 1;
  int segundos=0;

  bool comienzo = true;
  bool reseteado = false;
  bool revisarTiempo = true;

  int timeForTimer = 0;
  String timeDisplay = "00:00";


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Actividades Pomodoro'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50.0,),
            _formatoTimer(),
            SizedBox(height: 50.0,),
            _botones(),
            SizedBox(height: 50.0,),
            
          ],
        ),
        ),      
    );
  }



  //Funciones necesarias
 

 Widget _formatoTimer(){
   return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            estiloFondo('$timeDisplay'),
            SizedBox(width: 10,),
            
            
          ],
        );
 }

Widget estiloFondo(String texto) {

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: <BoxShadow> [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0, 10.0)
            ),
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: Text(texto, style: TextStyle(fontSize:50.0),),

        ),
      );

  }

 Widget _botones(){
  
   return Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 RaisedButton(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                   ),
                   color: Color.fromRGBO(121, 215, 15, 1.0),
                   
                   child: Text('Empezar'),
            
                   onPressed: comienzo ? empezar : null ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20.0),
                   ),
                    color: Color.fromRGBO(250, 22, 22, 1.0),
                    child: Text('Reset'),
                    onPressed: reseteado ? resetear : null),
               ],
             );
  }

void empezar(){
  setState(() {
      comienzo = false;
      reseteado = true;
    });

    timeForTimer = ((horas * 60 * 60) + (minutos*60) + segundos);

    Timer.periodic(Duration(seconds: 1),
     (Timer t) { 
       setState(() {
         if (timeForTimer <1 || revisarTiempo ==false){
           t.cancel();
           revisarTiempo = true;
           timeDisplay ="00:00";
           comienzo =true;
           reseteado = false;
           
         } else if(timeForTimer <60){
           //timeDisplay = timeForTimer.toString();
           timeDisplay="$timeForTimer";
           timeForTimer--;

         } else if( timeForTimer < 3600){
           int m = timeForTimer ~/ 60;
           int s = timeForTimer - (60 * m);
           timeDisplay = "$m : $s" ;
           timeForTimer--; 
         }else{
           int h = timeForTimer ~/ 3600;
           int t= timeForTimer - (3600 * h);
           int m = t ~/ 60;
           int s = t-(60*m);
           timeDisplay = "$h:$m:$s";
           timeForTimer--;
         }
       });
     });
}

void resetear(){
  setState(() {
    comienzo =true;
    reseteado = false;
    revisarTiempo =false;
  });
}
}