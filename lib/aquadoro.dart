import 'package:flutter/material.dart';
import 'dart:math'; //Para el random del contador que despues no se usara
import 'dart:async'; //para hacer uso del Timer


class Aquadoro extends StatefulWidget {
  // const Aquadoro({Key key}) : super(key: key);

  Aquadoro({
    this.actividad,
    this.tConcentracion,
    this.tDescanso,
  });

  final String actividad;
  final int tConcentracion;
  final int tDescanso;

  @override
  _AquadoroState createState() => _AquadoroState();
}

class _AquadoroState extends State<Aquadoro> {
  
  var rand = Random();
  int contador=0;
  bool kindAvticity = false;//para cambiar los strings e iconos Focus/Relax
  String tipoActividad = "Focus";
  String tiempoPantalla ;//Es el timer que se muestra en pantalla
 
  //Tiempo en segundos
  int tConcentracionSeg =0;
  int tDescansoSeg =0;


  //para ver si el contador esta haciendo la cuenta regresiva o esta detenido
  bool revisarTiempoConcentracion = true;
  bool revisarTiempoDes = true;
   
  int startState = 1;
  int resetState = 1;

  //Para activar o desactivar el boton de Focus y Relax, Reset
  bool botonDeshabilitado = false;
  bool resetDeshabilitado = false;

  Timer t; 
    /*       Tenemos 4 estados del boton start(Focus/Relax):
  * 1-Cuando aun no inicia el timer listo de Concentracion y esta habilitado
  * 2-C. se ejecuta el timer de concentracion y esta deshabilitado
  * 3-C. termina TimerFocus, esta listo TimerRelax y se habilita relax
  * 4-C. se ejecuta TimerRelax y esta
  */
  

  //Simulacoin Timers despues borrar👇🏼
  int pruebaTimer = 0;

  @override
  void initState() { 
    super.initState();
     tiempoPantalla = "${widget.tConcentracion.toString()}:00";
     //Por defecto se le asigna el del timer de Concentración
     resetDeshabilitado=true;   //PAra que al iniciar la pantalla el boton reset este deshabilitado
  }


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
                print("Tengo registrado relax : ${widget.tDescanso}");
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
   //contador = rand.nextInt(4)+1;
    //  contador = 5;
    // print('El valor del contador es  $contador');
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

      default: return Container(height: 45);
    }

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
          top: 140, left: 96, 
          child: Container(
            height: 81, width: 170,
            //  color: Colors.cyan[500], //Para poder ver que espacio se ocupa
            child: Column(
              children: <Widget>[
                Text(tipoActividad,
                  style: TextStyle(
                    fontSize: 23, color: Colors.indigo[800], 
                    fontWeight: FontWeight.bold 
                  ),
                ),
                Text( tiempoPantalla,
                style: TextStyle(fontSize: 45, color: Colors.indigo[600]),
                ),
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

      AbsorbPointer( //Para poder deshabilitar el boton de reset 
        absorbing: resetDeshabilitado,
              child: RaisedButton(
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
         onPressed: (){   

           if(tConcentracionSeg > 1 ){
             revisarTiempoConcentracion = false;
             startState = 1;
             print('Le diste en reset de focus');
               } else if (tDescansoSeg >1){
             revisarTiempoDes= false;
             startState =1;
             kindAvticity = false;
             tipoActividad = 'Focus';
             tiempoPantalla = "${widget.tConcentracion.toString()}:00";
             print('Le diste en reset de Relax y te regreso a Focus');
               }

          
             },
        ),
      ),

      //Se usa este widget para que el boton se deshabilite cuando el contador esta activo 
      AbsorbPointer(
            absorbing: botonDeshabilitado,  //recibe true o false, dependiendo el estado en el que se encuentre 
            child: OutlineButton(
           borderSide: BorderSide(
             width: 3, color: Colors.blue[900], style: BorderStyle.solid ),
           shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
           ),
           child: Row(
             children: <Widget>[
               Text( tipoActividad   ,
                style: TextStyle(fontSize: sizebotones, color: Colors.indigo[800]),
               ),

               Icon( (kindAvticity)? Icons.adjust : Icons.album , 
                size: sizebotones, color:Colors.blue[900]
               ) 
             ],
           ),
           onPressed: (){

            switch (startState) {
              case 1:{ //Timer Focus
                setState(() { //Para el icono de Relax Aquadoro
                  botonDeshabilitado = true;////Deshabilita el boton de Focus mientras el timer esta activo
                  resetDeshabilitado =false; //Habilita el boton de reset 
                });
                /**
                 * Metodo para correr el timer de Concentracion
                 */

                tConcentracionSeg = (widget.tConcentracion * 60);
                Timer.periodic(Duration(seconds: 1), 
                (t) { 
                  setState(() {
                    
                    if( tConcentracionSeg < 1 || revisarTiempoConcentracion == false){
                    t.cancel();
                    revisarTiempoConcentracion = true;
                    tiempoPantalla = "${widget.tConcentracion.toString()}:00";
                    botonDeshabilitado = false; //Habilita el boton de Focus
                    resetDeshabilitado = true; //Deshabilita el boton de reset
                    if(tConcentracionSeg < 1){
                      botonDeshabilitado=false;
                      startState=2;
                      tipoActividad = "Relax";
                      kindAvticity = true;
                      tiempoPantalla = "${widget.tDescanso.toString()}:00";
                    }
                    }else if( tConcentracionSeg < 60){
                      tiempoPantalla='$tConcentracionSeg';
                      tConcentracionSeg--;
                    }else if( tConcentracionSeg <3600 ){
                      int m = tConcentracionSeg ~/60;
                      int s = tConcentracionSeg - (60*m);
                      if (s<10){
                         tiempoPantalla = '$m:0$s';
                       }else{
                         tiempoPantalla = '$m:$s';
                       }
                      tConcentracionSeg--;
                    }else{
                      int h = tConcentracionSeg ~/3600;
                      int t = tConcentracionSeg - (3600*h);
                      int m = t ~/ 60;
                      int s = t-(60*m);
                      tiempoPantalla = '$h:$m:$s';
                      tConcentracionSeg--;  
                    }
                  });
                });

                print('Se hizo click en Focus');
              
              }break;
 
              case 2:{//Timer de Relax
                setState(() {
                  botonDeshabilitado = true; //Deshabilita el boton de Relax mientras el timer esta activo
                  resetDeshabilitado = false; //Habilita el boton de reset 
                });
                /**
                 * Metodo para correr el timer de Descanso
                 */
                tDescansoSeg = (widget.tDescanso * 60);
                Timer.periodic(Duration(seconds: 1),
                 (t) {
                   
                   setState(() {
                     if(tDescansoSeg < 1 || revisarTiempoDes ==false){
                       t.cancel();
                       revisarTiempoDes = true;
                       botonDeshabilitado = false; //Habilita el boton de Focus
                       resetDeshabilitado = true; //Deshabilita el boton de reset

                       if(tDescansoSeg <1 ){
                         startState =1; 
                         tipoActividad = "Focus";
                         kindAvticity = false;
                         tiempoPantalla = "${widget.tConcentracion.toString()}:00";
                        
                        if(contador <= 5){
                        contador++;//Le sumamos un Aquadoro al contador
                        print('El valor del contador es  $contador');
                        }else{
                          contador = 0;
                        }
                       }
                       
                     }else if(tDescansoSeg < 60 ){
                       tiempoPantalla = '$tDescansoSeg';
                       tDescansoSeg--;
                     } else if(tDescansoSeg < 3600 ){
                       int m = tDescansoSeg ~/60;
                       int s = tDescansoSeg - (60*m);
                       if (s<10){
                         tiempoPantalla = '$m:0$s';
                       }else{
                         tiempoPantalla = '$m:$s';
                       }
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

                print('Se hizo click en Relax');
              }break;

              default: break; //por defecto no hace nada xd
            }

           },
          ),

      ),
      

      // OutlineButton(
      //  borderSide: BorderSide(
      //    width: 3, color: Colors.blue[900], style: BorderStyle.solid ),
      //  shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(15)
      //  ),
      //  child: Row(
      //    children: <Widget>[
      //      Text('P',
      //       style: TextStyle(fontSize: 20, color: Colors.indigo[800]),
      //      ),

      //      Icon(Icons.adjust , size: sizebotones, color:Colors.blue[900]) 
      //    ],
      //  ),
      //  onPressed: (){
      //    Navigator.pushNamed(context, 'pomodoroPage' );
      //  },
      // ),

       

     ]
    );
  }

/*       Tenemos 4 estados del boton start(Focus/Relax):
 * 1-Cuando aun no inicia el timer listo de Concentracion y esta habilitado
 * 2-C. se ejecuta el timer de concentracion y esta deshabilitado
 * 3-C. termina TimerFocus, esta listo TimerRelax y se habilita relax
 * 4-C. se ejecuta TimerRelax y esta
*/


}//Class Aquadoro
