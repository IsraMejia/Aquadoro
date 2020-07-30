import 'package:flutter/material.dart';

class Aquadoro extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          fondoPomodoro(),
          SafeArea(child: Center(
            child: Column(
              children: <Widget>[
                 _nuestroApbar( context),
                 SizedBox(height: 80),
                 Text('hola',
                  style: TextStyle(fontSize: 30),
                 ),

              ],
            ),
          ),
         ),
        ]
      ),
    );
  }//build

  Widget _nuestroApbar(BuildContext context){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: <Widget>[

        FlatButton(
          padding: EdgeInsets.only(right: 20),
          onPressed: () {
              Navigator.pop(context);
              print("Tengo registrado : $actividad");
              print("Tengo registrado focus  : $tConcentracion");
              print("Tengo registrado relax : $tCDescanso");
          },
          child: Icon(Icons.arrow_back_ios, size: 35, color: Colors.cyan[100])
        ),

        
        Expanded(
          child: Text( "Practica de Dispositivos E." ,
            style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold ,color: Colors.cyan[50] ),
          ),
        ),
        


      ],
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

}//Class Aquadoro