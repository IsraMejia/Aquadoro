import 'package:flutter/material.dart';
/**
 * Este archivo genera las tarjetas de las actividades
 * La idea es que se puedan hacer tarjetas infinitas
 * usare una logica similar a la del chatbot y para agregar una nueva tarjeta
 * se hara uso de un boton en el goals page
 */
class GoalCard extends StatelessWidget{

  GoalCard({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
    this.animationController,
  });

  String actividad = 'Actividad';
  int tConcentracion = 25;
  int tDescanso = 5;
  final AnimationController animationController;  //para la animacion al agregar cada tarjeta
  
  
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent:  animationController , 
        curve: Curves.fastOutSlowIn),
      axisAlignment: 0.0,
      
      axis: Axis.vertical ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(15.0) ,
        ),
        margin: EdgeInsets.all(10.0),
        
        child: Row(
            
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container( //entrada de la actividad
            padding: EdgeInsets.only(left: 10.0, bottom: 13.0),
            width: anchoPantalla*0.45,
            child: _actividadInput(),
          ), 
          
          Spacer(),
          
          Container( 
            width: anchoPantalla*0.15,
            child: _inputConcentracion()),
          
          Spacer(),

          Container( 
            width: anchoPantalla*0.15,
            child: _inputDescanso()),
            
          Container(//boton para iniciar el pomodoro
            width: anchoPantalla*0.135,
            child: Align(
              alignment: Alignment.topLeft ,
              child: FlatButton(
                onPressed: (){},
                child: Icon(
                  Icons.arrow_forward_ios ,
                  size :anchoPantalla*0.1, 
                  color: Colors.cyan[700],
                ),
              ) ,
            )
          ),
        ],
        ),
      ),
    ); 
  }

  Widget _actividadInput(){
     return TextFormField(
      decoration: InputDecoration( 
      labelText: 'Actividad',
      labelStyle: TextStyle(fontSize: 13.0 ), 
      ),
     );
  }//_actividadInput()

  Widget _inputConcentracion(){
    return TextFormField( 
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Enfoque',
        hintText: 'minutos' ,
        hintStyle: TextStyle(fontSize: 10.0),
        labelStyle: TextStyle(fontSize: 13.0 ),
      ),
      // onSaved : (tiempoConcentracion)=> widget.tConcentracion  = double.parse(tiempoConcentracion) as int ,
    );
  }

  Widget _inputDescanso(){
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Descanso',
        labelStyle: TextStyle(fontSize: 13.0 ),
        hintText: 'minutos' ,
        hintStyle: TextStyle(fontSize: 10.0),
      ),
      // onSaved : (tiempoDescanso)=> widget.tDescanso  = double.parse(tiempoDescanso) as int ,
    );
  }


 
  

}