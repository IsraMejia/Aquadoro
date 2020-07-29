import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroPage extends StatefulWidget {
  // PomodoroPage({
  //   this.actividad,
  // });
  // final String actividad;
  @override
  _PomodoroPageState createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  _PomodoroPageState({
    this.actividad,
  });

  final String actividad;
  //Tiempo en minutos 
  int tiempoTrabajoMin = 1;
  int tiempoDescansoMin = 1;

//Tiempo en segundos
  int tiempoTrabajoSeg =0;
  int tiempoDescansoSeg =0;

  //para los botones
  bool botonComienzo = true;
  bool botonReseteo = false; 
  bool botonDescanso = false; 

  //para ver si el contador esta haciendo la cuenta regresiva o esta detenido
  bool revisarTiempoTra = true;
  bool revisarTiempoDes = true;

  String tiempoPantalla="00:00";
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          fondoPomodoro(),
          SafeArea(child: Center(
            child: Column(
              children: <Widget>[
                 _nuestroApbar(),
                 SizedBox(height:150.0),
                 _estiloTexto(),
                 SizedBox(height:60.0),
                 _botones(),

              ],
            ),
          ),
         ),
        ]
      ),
    );
  }


//____________________________Funciones a usar__________________________

  Widget _nuestroApbar(){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: <Widget>[

        FlatButton(
          padding: EdgeInsets.only(right: 20),
          onPressed: () {
              Navigator.pop(context );
              print("Tengo registrado :$actividad");
          },
          child: Icon(Icons.arrow_back_ios, size: 35, color: Colors.cyan[100])
        ),

        
        Expanded(
          child: Text( "Practica de Dispositivos" ,
            style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold ,color: Colors.cyan[50] ),
          ),
        ),
        


      ],
    );
  }




  //Formato fondo 
  Widget fondoPomodoro() {
    return Container(
     decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          Colors.cyan[700],
          Colors.cyan[600],
        ]
      )
     ),
    );
  } 

  //Fondo donde se vera el tiempo
  Widget _estiloTexto(){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
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
        child: Text(tiempoPantalla, style: TextStyle(fontSize:40.0)),
      ),

    );
  }
  

  ///Botones 
Widget _botones(){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text('Comenzar'),
            color: Colors.green,
            onPressed: botonComienzo ? _comenzarTimer : null
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text('Descanso'),
            color: Colors.lime,
            onPressed: botonDescanso ? _comenzarDescanso : null
            ),
 
        ],
      ),
      SizedBox(height:15.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text('Reseteo'),
          color: Colors.redAccent,
          onPressed: botonReseteo ? _reseteo : null 
          ),
        ],
      ),
    ],
  );


}



//funcion para comenzar el tiempo de Trabajo
  void _comenzarTimer(){
    setState(() {
      botonComienzo = false;
      botonReseteo = true;
      botonDescanso=false;
      

    });
    
      tiempoTrabajoSeg  = (tiempoTrabajoMin * 60);
      


    Timer.periodic(Duration (seconds: 1),
     (Timer t) {
      setState(() {

        if(tiempoTrabajoSeg < 1 || revisarTiempoTra ==false ){
          t.cancel();
          revisarTiempoTra = true;
          tiempoPantalla = "00:00";
          botonComienzo = true;
          botonReseteo = false;
          if(tiempoTrabajoSeg<1){
            botonDescanso =true;
          }

        }else if(tiempoTrabajoSeg < 60){
          
          tiempoPantalla='$tiempoTrabajoSeg';
          tiempoTrabajoSeg--;
        }else if(tiempoTrabajoSeg <3600){
          int m = tiempoTrabajoSeg ~/60;
          int s = tiempoTrabajoSeg - (60*m);
          tiempoPantalla = '$m:$s';
          tiempoTrabajoSeg--;
          
        }else{
          int h = tiempoTrabajoSeg ~/3600;
          int t = tiempoTrabajoSeg - (3600*h);
          int m = t ~/ 60;
          int s = t-(60*m);
          tiempoPantalla = '$h:$m:$s';
          tiempoTrabajoSeg--; 
          
        }
      });
     });

  }
  
  void _comenzarDescanso(){
    setState(() {
      botonReseteo = true;
      botonDescanso = false;
      botonComienzo=false;
      revisarTiempoDes=true;
    });
      //Se pasan los minutos de descanso a segundos 
  tiempoDescansoSeg =(tiempoDescansoMin * 60); 

  Timer.periodic(Duration(seconds: 1),
   (Timer t) { 
     setState(() {

       if(tiempoDescansoSeg < 1 || revisarTiempoDes ==false ){
          t.cancel();
          revisarTiempoDes = true;
          tiempoPantalla = "00:00";
          botonComienzo = true;   
          botonReseteo = false;
          botonDescanso =false;
          

        }else if(tiempoTrabajoSeg < 60){
          
          tiempoPantalla='$tiempoDescansoSeg';
          tiempoDescansoSeg--;
          
        }else if(tiempoDescansoSeg <3600){
          int m = tiempoDescansoSeg ~/60;
          int s = tiempoDescansoSeg - (60*m);
          tiempoPantalla = '$m:$s';
          tiempoDescansoSeg--;
          
        }else{
          int h = tiempoDescansoSeg ~/3600;
          int t = tiempoDescansoSeg - (3600*h);
          int m = t ~/ 60;
          int s = t-(60*m);
          tiempoPantalla = '$h:$m:$s';
          tiempoDescansoSeg--; 
        }
       
     });

  });

  }


  void _reseteo(){

   setState(() {
     botonComienzo=true;
     revisarTiempoTra=false;
     revisarTiempoDes=false;

      if(tiempoTrabajoSeg>1 || tiempoDescansoSeg>1){
     botonComienzo=true;
     botonReseteo = false;
     botonDescanso=false;
     revisarTiempoTra=false;
     revisarTiempoDes=false;

   }
   });
  }









}