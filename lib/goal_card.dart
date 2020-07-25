import 'package:flutter/material.dart';
import 'goals_page.dart';
/**
 * Este archivo genera las tarjetas de las actividades
 * La idea es que se puedan hacer tarjetas infinitas
 * usare una logica similar a la del chatbot y para agregar una nueva tarjeta
 * se hara uso de un boton en el goals page
 */
class GoalCard extends StatefulWidget{

  GoalCard({  
    this.animationController,
  });

  String actividad ;
  int tConcentracion;
  int tDescanso;

  final AnimationController animationController;  
  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;

    return  SizeTransition(
          sizeFactor: CurvedAnimation(
            parent: widget.animationController, 
            curve: Curves.linear 
            ),
          axisAlignment: 0.0, 
          
          child:  Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 255, 255   , 1) ,
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
              child: Container(
                alignment: AlignmentDirectional.center ,
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
    //); 
  }

  String initialActivity (){
    if (widget.actividad == null) { 
      return " " ;
    } else{
      return "${widget.actividad.toString()}" ;
    } 
  }

  String initialConcentracion (){
    if (widget.tConcentracion == null) {
      return " " ;
    } else{
      return "${widget.tConcentracion}" ;
    } 
  }

  String initialDescanso (){
    if (widget.tDescanso == null) {
       return " " ;
    }else{
      return "${widget.tDescanso}" ;
      }
  } 
  

  Widget _actividadInput(){
     return TextFormField(
      initialValue: initialActivity() /*"initial"*/ ,//
      decoration: InputDecoration( 
      labelText: "Actividad" ,
      labelStyle: TextStyle(fontSize: 13.0 ), 
      ),
      onChanged :(activity){
        setState(() {
          widget.actividad = activity;
          print("Actividad :${widget.actividad}");
        });
      },
     );
  }
  Widget _inputConcentracion(){
    return TextFormField( 
      initialValue: initialConcentracion() ,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Enfoque',
        labelStyle: TextStyle(fontSize: 13.0 ),
      ),
      onChanged : (tiempoConcentracion){
        setState(() {
          widget.tConcentracion  = (double.parse(tiempoConcentracion)).toInt();
          print("Tiempo de concentracion $tiempoConcentracion");
        });
      }
    );
  }

  Widget _inputDescanso(){
    return TextFormField(
      initialValue: initialDescanso(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Descanso',
        labelStyle: TextStyle(fontSize: 13.0 ),
      ),
       onChanged : (tiempoDescanso){
         widget.tDescanso  = (double.parse(tiempoDescanso)).toInt() ;
         print("Tiempo de Descanso $tiempoDescanso");
       }
    );
  }
}