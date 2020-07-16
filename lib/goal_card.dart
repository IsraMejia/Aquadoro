import 'package:flutter/material.dart';
/**
 * Este archivo genera las tarjetas de las actividades
 * La idea es que se puedan hacer tarjetas infinitas
 * usare una logica similar a la del chatbot y para agregar una nueva tarjeta
 * se hara uso de un boton en el goals page
 */
class GoalCard extends StatefulWidget {

  GoalCard({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });

  String actividad = 'Actividad';
  int tConcentracion = 25;
  int tDescanso = 5;

  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;

    return  Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container( //entrada de la actividad
            width: anchoPantalla*0.3,
            padding: EdgeInsets.symmetric( horizontal: 5.0),
            child: _actividadInput(),
          ),

          Expanded(//entrada de tiempos
            child: Row(
              children: <Widget>[
                _inputConcentracion(),
                _inputDescanso()
              ],
            )
          ),
          
          Container(//boton para iniciar el pomodoro
            width: anchoPantalla*0.15,
            child: FlatButton(
              onPressed: (){},
               child: Icon(Icons.chevron_right),
            ),
          ),

         ],
        ),
      ); 
  }

  Widget _actividadInput(){
     return TextFormField(
       cursorWidth: 10.0,
      autofocus: true,
      // controller: _textController,
      decoration: InputDecoration(
      
      hintText: 'Actividad',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), 
      ),
      onSaved : (actividad)=> widget.actividad = actividad
      
    );
  }//_actividadInput()

  Widget _inputDescanso(){
    return TextFormField(
       initialValue:  'Descanso',
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "minutos",
      ),
      onSaved : (tiempoDescanso)=> widget.tDescanso  = double.parse(tiempoDescanso) as int ,
    );
  }

  Widget _inputConcentracion(){
    return TextFormField(
       initialValue:  'Concentracion',
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "minutos",
      ),
      onSaved : (tiempoConcentracion)=> widget.tConcentracion  = double.parse(tiempoConcentracion) as int ,
    );
  }


  
}