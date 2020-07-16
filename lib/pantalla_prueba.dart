import 'package:flutter/material.dart';
import 'package:aquadoro/goal_card.dart';

class PantallaPrueba extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Pruebas'),
      ),
      body:  Container(
        margin: EdgeInsets.all(10.0),
        child: Row(
          
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container( //entrada de la actividad
            width: anchoPantalla*0.45,
            padding: EdgeInsets.symmetric( horizontal: 5.0),
            child: _actividadInput(),
          ),

          Container(
            width: anchoPantalla*0.2,
            child: _inputConcentracion()),
          Container(
            width: anchoPantalla*0.2,
            child: _inputDescanso()),
              
            
          
          
          Container(//boton para iniciar el pomodoro
            width: anchoPantalla*0.05,
            child: FlatButton(
              
              onPressed: (){},
               child: Icon(Icons.chevron_right),
            ),
          ),

         ],
        ),
      ),
    );
  }

    Widget _actividadInput(){
     return TextFormField(
      decoration: InputDecoration(
      
      hintText: 'Actividad',
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ), 
      ),
      // onSaved : (actividad)=> widget.actividad = actividad
      
    );
  }//_actividadInput()

  Widget _inputDescanso(){
    return TextFormField(
      //  initialValue:  'Descanso',
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "minutos",
        hintText: 'Descanso',
      ),
      // onSaved : (tiempoDescanso)=> widget.tDescanso  = double.parse(tiempoDescanso) as int ,
    );
  }

  Widget _inputConcentracion(){
    return TextFormField(
      //  initialValue:  'Concentracion',
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "minutos",
        hintText: 'Concentracion',
      ),
      // onSaved : (tiempoConcentracion)=> widget.tConcentracion  = double.parse(tiempoConcentracion) as int ,
    );
  }


}