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
      body:  Column(
        children: <Widget>[
          Container(
        margin: EdgeInsets.all(25.0),
        child: Row(
          
        crossAxisAlignment: CrossAxisAlignment.start ,
        mainAxisAlignment: MainAxisAlignment.spaceBetween ,
        children: <Widget>[
          Expanded( //entrada de la actividad
           
            child: _actividadInput(),
          ),

          Container(
            
            width: anchoPantalla*0.15,
            child: _inputConcentracion()),
          Container(
            // padding: EdgeInsets.only(left:0.02),
            width: anchoPantalla*0.15,
            child: _inputDescanso()),
              
          
          Container(//boton para iniciar el pomodoro
            width: anchoPantalla*0.1,
            alignment: Alignment.center ,
            child: FlatButton(
              onPressed: (){},
               child: Icon(Icons.keyboard_arrow_right , size :anchoPantalla*0.1, ),
            ),
          ),

         ],
        ),
      ),
    
//---------------------------------------------------
        Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.circular(10.0) ,
        ),  
        margin: EdgeInsets.all(20.0),
        child: Row(
          
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: <Widget>[
          Container( //entrada de la actividad
            padding: EdgeInsets.only(left: 10.0),
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
            // padding: EdgeInsets.only(right: 30.0),
            child: Align(
              alignment: Alignment.topLeft ,
              child: FlatButton(
               onPressed: (){},
               child: Icon(
                Icons.timer ,
                size :anchoPantalla*0.1, 
                color: Colors.cyan[700],
               ),
              ) ,
            )
            
          ),
// Spacer()
         ],
        ),
      )
    


        ],
      )


      
    

    
    
    
    );
  }

    Widget _actividadInput(){
     return TextFormField(
      decoration: InputDecoration( 
      // hintText: 'Actividad',
      // hintStyle: TextStyle(fontSize: 14.0),
      labelText: 'Actividad',
      labelStyle: TextStyle(fontSize: 13.0 ),
      
      ),
      onSaved : (actividad){
        print(actividad);
      } 
      // onChanged: (act){
      //   print(act);
      // },
      // onEditingComplete: , //Al parecer usa lo del focus
      
    );
  }//_actividadInput()

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


}