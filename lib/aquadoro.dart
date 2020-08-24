import 'package:flutter/material.dart';
import 'dart:math'; //Para el random del contador que despues no se usara
import 'dart:async'; //para hacer uso del Timer
import 'package:flare_flutter/flare_actor.dart';

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
  String animacionActual = "reset" ;
  var rand = Random();
  int contador=3;
  bool kindAvticity = false;//para cambiar los strings e iconos Focus/Relax
  String tipoActividad = "Focus";
  String tiempoPantalla ;//Es el timer que se muestra en pantalla
 
  //Tiempo en segundos
  int tConcentracionSeg =0;
  int tDescansoSeg =0;
  double porcentaje; //Para comparar al momento de decidir animacion de tiempo

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
  
  //TiempoTotal Comparacion para Animaciones
  int concentracion100 = widget.tConcentracion * 1 /*60*/;
  int descanso100 = widget.tDescanso * 1 /*60*/ ;
  double ancho = MediaQuery.of(context).size.width;
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
                 _aquadoroStack(ancho),
                 Expanded(child: Container()),
                 _botones(context, concentracion100, descanso100),
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
          Colors.cyan[500],
          Colors.cyan[700],
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
            padding: EdgeInsets.only(right: 10, top: 10),
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
          child: Container(
            padding: EdgeInsets.only(top: 10 ),
            child: Text( widget.actividad ,
              style: TextStyle( fontSize: 30,fontWeight: FontWeight.bold ,color: Colors.cyan[50] ),
            ),
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

  Widget _aquadoroStack( double ancho ){
    return Stack(
      children: <Widget>[

        // Container(
        //   width: 357,
        //   height: 357,
        //   margin: EdgeInsets.all(10),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     image: DecorationImage(
        //       image: AssetImage("assets/Acuadoro.png" ),
        //       fit: BoxFit.cover
        //   ),
        //  ),
        // ),

        Container(//Cerrar y volver a cargar desde cero la app la primera
        //vez porque los cambios fueron bastantes incluyendo en el yaml
            // color: Colors.indigo ,
            width: 400 ,
            height: 400,
            child: FlareActor(
              'assets/Acuadoro.flr',
              alignment: Alignment.center,
              fit: BoxFit.cover ,
              animation: animacionActual,
              /**Queremos que 
               * 
               */
            ),
        ),



        Positioned(
          top: 160, left: ancho * 0.28 , 
          child: Container(
            height: 100, width: 170,
            //  color: Colors.cyan[500], //Para poder ver que espacio se ocupa
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(tipoActividad,
                    style: TextStyle(
                      fontSize: 25, color: Colors.indigo[800], 
                      fontWeight: FontWeight.bold 
                    ),
                  ),
                ),
                Center(
                  child: Text( tiempoPantalla,
                  style: TextStyle(fontSize: 55, color: Colors.indigo[600]),
                  ),
                ),
              ],
            ),
          )
        ),

      ],
    );
  }

  Widget _botones(BuildContext context ,  int concentracion100, int descanso100){
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

           if(startState == 3){
             contador = 0;
           }

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

                tConcentracionSeg = (widget.tConcentracion * 1/*60*/);
                Timer.periodic( Duration(seconds: 1), 
                 (t) { 
                  setState(() {
                    
                    if( tConcentracionSeg < 1 || revisarTiempoConcentracion == false){
                      //En caso de que se acabe el tiempo ó ya definicio el tiempo de concentracion
                    t.cancel();
                    revisarTiempoConcentracion = true;
                    tiempoPantalla = "${widget.tConcentracion.toString()}:00";
                    botonDeshabilitado = false; //Habilita el boton de Focus
                    resetDeshabilitado = true; //Deshabilita el boton de reset

                    if(tConcentracionSeg < 1){
                      //En caso de que solo se haya acabado el tiempo de concentracion
                      botonDeshabilitado=false;
                      startState=2;
                      tipoActividad = "Relax";
                      kindAvticity = true;
                      // tiempoPantalla = "${widget.tDescanso.toString()}:00";

                      if(contador == 4){
                        //Si debe pasar a su descanso largo de 30 minutos
                        _mostrarAlerta(context);
                        contador = 5;
                        tiempoPantalla = "${30}:00";
                      }else{
                        tiempoPantalla = "${widget.tDescanso.toString()}:00";
                        print(porcentaje);
                      }

                    }//Si sigue Corriendo el tiempo de concentracion:
                    
                     //Logica para imprimir en pantalla el timer
                    }else if( tConcentracionSeg < 60){ //Si solo quedan menos de un minuto
                      tiempoPantalla='$tConcentracionSeg';
                      tConcentracionSeg--;
                    }else if( tConcentracionSeg <3600 ){//Si quedan minutos, menos de una hora
                      int m = tConcentracionSeg ~/60;
                      int s = tConcentracionSeg - (60*m);
                      if (s<10){
                         tiempoPantalla = '$m:0$s';
                       }else{
                         tiempoPantalla = '$m:$s';
                       }
                      tConcentracionSeg--;
                    }else{                             //Si quedan horas 
                      int h = tConcentracionSeg ~/3600;
                      int t = tConcentracionSeg - (3600*h);
                      int m = t ~/ 60;
                      int s = t-(60*m);
                      tiempoPantalla = '$h:$m:$s';
                      tConcentracionSeg--;  
                    }

                    //Logica para definir la animacion del reloj de concentracion
                    // animacionActual <- Variable con la que se define

                    porcentaje = ( tConcentracionSeg * 100) /   concentracion100 ; //Porcentaje del tiempo transcurrido
                    
                    if(revisarTiempoConcentracion == true){
                      if((porcentaje >= 75) && (porcentaje < 100)){
                        animacionActual = "0-25%Concentracion";
                        print(animacionActual);
                      } else if ( (porcentaje >= 50) && (porcentaje < 75) ){
                        animacionActual = "25-50%Concentracion" ;
                        print(animacionActual);
                      } else if ( (porcentaje >= 25) && (porcentaje < 50) ){
                        animacionActual = "50-75%Concentracion" ;
                        print(animacionActual);
                      } else if ( (porcentaje >= 5) && (porcentaje < 25) ){
                        animacionActual = "75-100%Concentracion" ;
                        print(animacionActual);
                      }else if( porcentaje <= 2){
                        animacionActual = "finConcentracion" ;
                        print(animacionActual);
                      }
                      print('El porcentaje es: $porcentaje');
                    }
                    
                    

                  });
                }
                );

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
                tDescansoSeg = (widget.tDescanso * 1/*60*/);
                Timer.periodic(Duration(seconds: 1),
                 (t) {
                   
                   setState(() {
                     if(tDescansoSeg < 1 || revisarTiempoDes ==false){
                        //En caso de que se acabe el tiempo ó ya definio el revisarTiempoDescanso
                       t.cancel();
                       revisarTiempoDes = true;
                       botonDeshabilitado = false; //Habilita el boton de Focus
                       resetDeshabilitado = true; //Deshabilita el boton de reset

                       if(tDescansoSeg <1 ){
                         //Si se acabo el tiempo de descanso
                         startState =1; 
                         tipoActividad = "Focus";
                         kindAvticity = false;
                         tiempoPantalla = "${widget.tConcentracion.toString()}:00";
                        
                        if(contador < 4){
                        contador++;//Le sumamos un Aquadoro al contador
                        print('El valor del contador es  $contador');
                        }

                       } //De lo contrario aun esta en cuenta regresiba 

                      //Logica para mostrar en pantalla el tiempo
                     }else if(tDescansoSeg < 60 ){ //Si queda menos de un minuto de descanso
                       tiempoPantalla = '$tDescansoSeg';
                       tDescansoSeg--;
                     } else if(tDescansoSeg < 3600 ){ //Si queda menos de una hota de descanso
                       int m = tDescansoSeg ~/60;
                       int s = tDescansoSeg - (60*m);
                       if (s<10){
                         tiempoPantalla = '$m:0$s';
                       }else{
                         tiempoPantalla = '$m:$s';
                       }
                       tDescansoSeg--;
                     }else{                          //Si quedan horas de descanso
                       int h = tDescansoSeg ~/3600;
                       int t = tDescansoSeg - (3600*h);
                       int m = t ~/ 60;
                       int s = t-(60*m);
                       tiempoPantalla = '$h:$m:$s';
                       tDescansoSeg--; 
                     }

                     //Logica para definir la animacion del reloj de concentracion
                    // animacionActual <- Variable con la que se define
                    if(porcentaje == 0.0){
                      animacionActual = "75-100%Concentracion";
                    }
                    porcentaje = ( tDescansoSeg * 100) /   descanso100 ; //Porcentaje del tiempo transcurrido
                    
                    if(revisarTiempoDes == true){
                      if((porcentaje >= 75) && (porcentaje < 100)){
                        animacionActual = "75-100%Concentracion";
                        print(animacionActual);
                      } else if ( (porcentaje >= 50) && (porcentaje < 75) ){
                        animacionActual = "50-75%Concentracion" ;
                        print(animacionActual);
                      } else if ( (porcentaje >= 25) && (porcentaje < 50) ){
                        animacionActual = "25-50%Concentracion" ;
                        print(animacionActual);
                      } else if ( (porcentaje <= 5)  && (porcentaje < 25) ){
                        animacionActual = "0-25%Concentracion" ;
                        print(animacionActual);
                      } else if( porcentaje <= 2){
                        animacionActual = "finDescanso" ;
                        print(animacionActual);
                      }
                      print('El porcentaje es: $porcentaje');
                    }





                   });
                  });

                print('Se hizo click en Relax');
              }break;
              //break case 2 Descanso normal

              case 3:{//Timer de Relax Largo 30---------
                setState(() {
                  botonDeshabilitado = true; //Deshabilita el boton de Relax mientras el timer esta activo
                  resetDeshabilitado = false; //Habilita el boton de reset 
                });
                /**
                 * Metodo para correr el timer de Descanso
                 */
                tDescansoSeg = (30  * 1/*60*/);// ---------
                Timer.periodic(Duration(seconds: 1),
                 (t) {
                   
                   setState(() {
                     if(tDescansoSeg < 1 || revisarTiempoDes ==false){
                       //En caso de que se acabe el tiempo ó ya definio el revisarTiempoDescanso
                       t.cancel();
                       revisarTiempoDes = true;
                       botonDeshabilitado = false; //Habilita el boton de Focus
                       resetDeshabilitado = true; //Deshabilita el boton de reset

                       if(tDescansoSeg <1 ){
                         //En caso de que solo se acabo el tiempo 
                         startState =1; 
                         tipoActividad = "Focus";
                         kindAvticity = false;
                         tiempoPantalla = "${widget.tConcentracion.toString()}:00";
                         contador =0;
      
                       }
                       
                     }else if(tDescansoSeg < 60 ){ //Si queda menos de un minuto
                       tiempoPantalla = '$tDescansoSeg';
                       tDescansoSeg--;
                     } else if(tDescansoSeg < 3600 ){ //si queda mas de un minuto, pero menos de una hora
                       int m = tDescansoSeg ~/60;
                       int s = tDescansoSeg - (60*m);
                       if (s<10){                     
                         tiempoPantalla = '$m:0$s';
                       }else{
                         tiempoPantalla = '$m:$s';
                       }
                       tDescansoSeg--;
                     }else{                          //Si quedan horas en el timer
                       int h = tDescansoSeg ~/3600;
                       int t = tDescansoSeg - (3600*h);
                       int m = t ~/ 60;
                       int s = t-(60*m);
                       tiempoPantalla = '$h:$m:$s';
                       tDescansoSeg--; 
                     }

                   });
                  });

                print('Se hizo click en Relax ');
              }break;
              //break case 3 Descanso Largo


              default: break; //por defecto no hace nada xd
            }

           },
          ),


      ),
      
     ]
    );
  }


  void _mostrarAlerta(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true, //Se cierra cuando das click afuera :)

      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20.0) ), //Bordes redondeados
          backgroundColor: Colors.teal[200] ,
          elevation: 25.0,

          title: Text('\t\tFelicidades :)', style: TextStyle(fontSize: 30, color:  Colors.blue[900]  ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,//Ahora el tamaño del Column sera el minimo para embolver contenido
            //De esta forma se define el tamaño del AlertDialog 
            children: [
              Text('Haz realizado 5 pomodoros seguidos 🤓',
                style: TextStyle(fontSize: 20.5 , color: Colors.indigo[900] ),
              ),
              Text('Te recomendamos dividir esta meta en unas mas pequeñas para ligerar la carga.',
                style: TextStyle(fontSize: 20  , color: Colors.indigo[900] ),
              ),
              Text('\t¿Nos tomamos un descanso de 30 minutos?',
                style: TextStyle(fontSize: 20   , color: Colors.indigo[900]),
              ),
              Image.asset("assets/AlertImage.png",
                fit: BoxFit.cover,
                height: 170,
              )
  
            
            ],
          ),
          actions: [
            FlatButton(
              onPressed: (){
                /**Para Regresar a goals page podemos hacerlo de dos manerass con el popUntil
                 * o con el pop dos veces, despues de estarle moviendo muchas veces a la app
                 * la mas sencilla y pracrica es la segunda (ademas que la otra falla aveces quien sabe porque)
                */
                //Navigator.pushNamed(context, 'goalsPage') ;//Arreglar que mande a Goals page sin borrar las metas XD
                //Navigator.popUntil(context, ModalRoute.withName('goalsPage')); //Te manda al GoalsPage sin perder lo que ya tenia  :o
                Navigator.pop(context);
                Navigator.pop(context);
                
              },
              child: Text('Sudividir', style: TextStyle(fontSize: 24, color: Colors.lightBlue[800] ))
            ),
            FlatButton(
              onPressed: (){
                Navigator.pop(context);
                //Aqui poner el 3er caso del switch case donde se hace el descanso largo
                setState(() {
                  startState =3;
                  print('Se mando al startState3');
                });
              },
              child: Text('Descansar', style: TextStyle(fontSize: 24 , color: Colors.blueAccent[700]) )
            ),
          ],

        );
      }

    );
  }//Widget _mostrarAlerta

}//Class Aquadoro