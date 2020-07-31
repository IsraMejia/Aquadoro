import 'dart:async';

import 'package:flutter/material.dart';

class PomodoroPage extends StatefulWidget{
  @override
  _PomodoroPageState createState() => _PomodoroPageState();
}

class _PomodoroPageState extends State<PomodoroPage> {
  
  //Tiempo en minutos 
  int tConcentracion = 1;
  int tDescanso = 1;

//Tiempo en segundos
  int tConcentracionSeg =0;
  int tDescansoSeg =0;

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
    
      tConcentracionSeg  = (tConcentracion * 100);//tConcentracion
      //Aqui se define el tiempo hardcodeado xd, en acuadoro es tConcentracion
    

    Timer.periodic(Duration (seconds: 1), (Timer t) {
      setState(() {

        if(tConcentracionSeg < 1 || revisarTiempoTra ==false ){
          t.cancel();
          revisarTiempoTra = true;
          tiempoPantalla = "00:00";
          botonComienzo = true;
          botonReseteo = false;
          if(tConcentracionSeg<1){
            botonDescanso =true;
          }

        }else if(tConcentracionSeg < 60){
          
          tiempoPantalla='$tConcentracionSeg';
          tConcentracionSeg--;
        }else if(tConcentracionSeg <3600){
          int m = tConcentracionSeg ~/60;
          int s = tConcentracionSeg - (60*m);
          tiempoPantalla = '$m:$s';
          tConcentracionSeg--;
          
        }else{
          int h = tConcentracionSeg ~/3600;
          int t = tConcentracionSeg - (3600*h);
          int m = t ~/ 60;
          int s = t-(60*m);
          tiempoPantalla = '$h:$m:$s';
          tConcentracionSeg--;  
        }
      }); //SetState
     }//(Timer t)
    );

  }
  
  void _comenzarDescanso(){
    setState(() {
      botonReseteo = true;
      botonDescanso = false;
      botonComienzo=false;
      revisarTiempoDes=true;
    });
      //Se pasan los minutos de descanso a segundos 
  tDescansoSeg =(tDescanso * 62); 

  Timer.periodic(Duration(seconds: 1),
   (Timer t) { 
     setState(() {

       if(tDescansoSeg < 1 || revisarTiempoDes ==false ){
          t.cancel();
          revisarTiempoDes = true;
          tiempoPantalla = "00:00";
          botonComienzo = true;   
          botonReseteo = false;
          botonDescanso =false;
          

        }else if(tConcentracionSeg < 60){
          
          tiempoPantalla='$tDescansoSeg';
          tDescansoSeg--;
          
        }else if(tDescansoSeg <3600){
          int m = tDescansoSeg ~/60;
          int s = tDescansoSeg - (60*m);
          tiempoPantalla = '$m:$s';
          tDescansoSeg--;
          
        }else{
          int h = tDescansoSeg ~/3600;
          int t = tDescansoSeg - (3600*h);
          int m = t ~/ 60;
          int s = t-(60*m);
          tiempoPantalla = '$h:$m:$s';
          tDescansoSeg--; 
        }
       
     });

  });

  }


  void _reseteo(){
   setState(() {
     botonComienzo=true;
     revisarTiempoTra=false;
     revisarTiempoDes=false;

      if(tConcentracionSeg>1 || tDescansoSeg>1){
      //En caso de que aun tenga tiempo los timers      
        botonComienzo=true;
        botonReseteo = false;
        botonDescanso=false;
        revisarTiempoTra=false;
        revisarTiempoDes=false;

      }
   });
  }









}