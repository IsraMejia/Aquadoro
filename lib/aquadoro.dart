import 'package:flutter/material.dart';
import 'dart:math';

class Aquadoro extends StatefulWidget {
  // const Aquadoro({Key key}) : super(key: key);

  Aquadoro({
    this.actividad,
    this.tConcentracion,
    this.tCDescanso,
  });

  final String actividad;
  final int tConcentracion;
  final int tCDescanso;

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  var rand = Random();
  int contador  ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          fondoPomodoro(),
          SafeArea(child: Center(
            child: Column(
              children: <Widget>[
                 _nuestroApbar( context),
                //  Expanded(child: Container()),
                 SizedBox(height: 40,),
                 _contadorAcuadoros(),
                 SizedBox(height: 20,),
                 _aquadoroStack(),
                 Expanded(child: Container()),
                 _botones(context),
                 Expanded(child: Container()),

              ],
            ),
          ),
         ),
        ]
      ),
    );
  }
  
  Widget fondoPomodoro() {
    return Container(
     decoration: BoxDecoration(
      gradient: LinearGradient(
        
        colors: <Color>[
          Colors.cyan[600],
          Colors.cyan[500],
        ]
      )
     ),
    );
  } 


  Widget _nuestroApbar(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: <Widget>[

        Container(
          width: 50,
          child: FlatButton(
            padding: EdgeInsets.only(right: 10),
            onPressed: () {
                Navigator.pop(context);
                print("Tengo registrado : ${widget.actividad}");
                print("Tengo registrado focus  : ${widget.tConcentracion}");
                print("Tengo registrado relax : ${widget.tCDescanso}");
            },
            child: Icon(Icons.arrow_back_ios, size: 35, color: Colors.cyan[100])
          ),
        ),

        
        Expanded(
          child: Text( widget.actividad ,
            style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold ,color: Colors.cyan[50] ),
          ),
        ),
        
      ],
    );
  }

  Widget _contadorAcuadoros(){
    contador = rand.nextInt(4)+1;
    print('El valor del contador es  $contador');
    switch (contador) {
      
      case 1:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: <Widget>[
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ),    
         ],
        );   
      break;

      case 2:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: <Widget>[
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ),   
         ],
        );   
      break;

      case 3:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: <Widget>[
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ),   
         ],
        );   
      break;

      case 4:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: <Widget>[
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
         ],
        );   
      break;

      case 5:
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround ,
        children: <Widget>[
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ),  
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ), 
          Icon( Icons.av_timer,
            color: Colors.teal[50],
            size: 45,
          ),  
         ],
        );   
      break;


      default: return Icon( Icons.av_timer, color: Colors.teal[50], size: 45, );
    }


    return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround ,
     children: <Widget>[

        Icon( Icons.av_timer,
          color: Colors.teal[50],
          size: 45,
        ),

        Icon( Icons.av_timer,
          color: Colors.teal[50],
          size: 45,
        ),

        Icon( Icons.av_timer,
          color: Colors.teal[50],
          size: 45,
        ),

        Icon( Icons.av_timer,
          color: Colors.teal[50],
          size: 45,
        ),

        Icon( Icons.av_timer,
          color: Colors.teal[50],
          size: 45,
        ),
       
     ],
    ); 
    //5 pomodoros 


  }

  Widget _aquadoroStack(){
    return Stack(
      children: <Widget>[

        Container(
          width: 357,
          height: 357,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: AssetImage("assets/Acuadoro.png" ),
              fit: BoxFit.cover
          ),
         ),
        ),

        Positioned(
          top: 120, left: 94, 
          child: Container(
            height: 100, width: 170,
            color: Colors.blue[200],
            child: Column(
              children: <Widget>[

              ],
            ),
          )
        ),

      ],
    );
  }

  Widget _botones(BuildContext context){
    double sizebotones= 27.0;
    return Row(
     mainAxisAlignment: MainAxisAlignment.spaceAround ,
     children: <Widget>[

      RaisedButton(
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
       ),
       color: Colors.cyan[200],
       child: Row(
         children: <Widget>[
           Text('Reset',
            style: TextStyle(fontSize: sizebotones, color: Colors.teal[900]),
           ),
           Icon(Icons.rotate_left , size: sizebotones, color:Colors.teal[900])
         ],
       ),
       onPressed: (){       },
      ),

      OutlineButton(
       borderSide: BorderSide(
         width: 3, color: Colors.blue[900], style: BorderStyle.solid ),
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
       ),
       child: Row(
         children: <Widget>[
           Text('Focus',
            style: TextStyle(fontSize: sizebotones, color: Colors.indigo[800]),
           ),

           Icon(Icons.album , size: sizebotones, color:Colors.blue[900]) 
         ],
       ),
       onPressed: (){
        
       },
      ),

      OutlineButton(
       borderSide: BorderSide(
         width: 3, color: Colors.blue[900], style: BorderStyle.solid ),
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
       ),
       child: Row(
         children: <Widget>[
           Text('P',
            style: TextStyle(fontSize: 20, color: Colors.indigo[800]),
           ),

           Icon(Icons.adjust , size: sizebotones, color:Colors.blue[900]) 
         ],
       ),
       onPressed: (){
         Navigator.pushNamed(context, 'pomodoroPage' );
       },
      ),

       

     ]
    );
  }

}//Class Aquadoro