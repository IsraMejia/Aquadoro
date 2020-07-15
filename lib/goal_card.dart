import 'package:flutter/material.dart';
/**
 * Este archivo genera las tarjetas de las actividades
 * La idea es que se puedan hacer tarjetas infinitas
 * usare una logica similar a la del chatbot y para agregar una nueva tarjeta
 * se hara uso de un boton en el goals page
 */
class GoalCard extends StatelessWidget {

  GoalCard({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });

  String actividad;
  int tConcentracion;
  int tDescanso;
  final AnimationController animationController;

  

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;

    return SizeTransition(
      sizeFactor: 
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut
      ),
      axisAlignment: 0.0,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(//Texto de Actividad
          //Pensandolo bien aqui sera un textflied
            width: anchoPantalla*0.4,
            padding: EdgeInsets.symmetric( horizontal: 5.0),
            child: Text(  actividad,
              style: TextStyle(
                fontSize: 18, color: Colors.blueGrey[600]
              ),
              textAlign: TextAlign.start, 
            ),
          ),

          //numberspickers para los tiempos del timer



         ],
        ),
      ),
    );
  }//build

  /*
  Estaba pensando si dividirlo en distintos metodos para no hacer un 
  mounstro que no se pueda leer, pero viendola bien
  las tarjetas no necesitaran mucho, espero jaja
   
  Widget _goalCard(String actividad, int tCon, int tDesc){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(

        ),
      ],
    );
  }*/
}