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
             Text( tipoActividad   ,
              style: TextStyle(fontSize: sizebotones, color: Colors.indigo[800]),
             ),

             Icon( (kindAvticity)? Icons.adjust : Icons.album , 
              size: sizebotones, color:Colors.blue[900]
             ) 
           ],
         ),
         onPressed: () {

          switch (startState) {
            case 1:{ //En caso que se de click al boton que sale cuando se inicia la app
              setState(() {
                //  startState = 2; //Para cambiar al segundo estado
                // revisarTiempoConcentracion = true;
              });
              /**
               * Metodo para correr el timer de Concentracion
               */
              print('Se hizo click en 1 , AHORA estoy en startState= $startState');
              
            }break;
 
            case 2:{//En caso en que se de click al boton cuando esta corriendo el timer Concentracion
              if(revisarTiempoConcentracion == false){
                //Si se termino la cuenta regresiva del timer de concentracion
                setState(() {
                  startState = 3; //Para cambiar al tercer Estado estado
                  tipoActividad = 'Relax'; 
                  kindAvticity = true ; //Para el icono de Relax Aquadoro
                  
                });
              }else{
              //Si sigue en cuenta regresiva no hace nada xd
                setState(() {
                  //-------Simulacion del timer
                  if(pruebaTimer <= 1){
                    pruebaTimer++;
                    print('PruebaTimer = $pruebaTimer');
                  }else{
                    revisarTiempoConcentracion = false; //Se termino el timer :v jaja
                    print('PruebaTimer = $pruebaTimer con tConcentracion $revisarTiempoConcentracion');
                    pruebaTimer =0;
                  }
                  //-------
                });

              }
              print('Se hizo click en 2 , AHORA estoy en startState= $startState');
            }break;

            case 3:{//En caso de que este habilitado el timer Relax y se de click en él 
              setState(() {
                startState = 4; //Para cambiar al cuarto estado
                tipoActividad = 'Focus';
                kindAvticity = false; //Para el icono de focus Aquadoro
                revisarTiempoDes = true;
              });
              print('Se hizo click en 3 , AHORA estoy en startState= $startState');
              /**
               * Metodo para correr el timer de Concentracion
               */
            } 
            break;

            case 4:{//En caso de que este corriendo el timer de relajacion y se de click
              if( revisarTiempoDes == false){
                //Si termino la cuenta regresiva del tiempo de descanso 
                setState(() {
                  startState = 1; //Cambiar al primer estado
                  tipoActividad = 'Focus';
                  kindAvticity = false; //Para el icono de focus Aquadoro
                  revisarTiempoConcentracion =true;
                  if(contador <= 5){
                   contador++;//Le sumamos un Aquadoro al contador
                   print('El valor del contador es  $contador');
                  } else{
                    contador =0;
                    /**
                     * Lanzar alert dialog de subdivir las tareas y tomar descanso largo
                     */
                    print('Te recomiendo subdivir las tareas y tomar descanso largo');
                  }
                });
                //Si sigue en cuenta regresiva no hace nada xd
                print('Se hizo click en 4 , AHORA estoy en startState= $startState');
              }else{
              //Si sigue en cuenta regresiva no hace nada xd
                setState(() {
                  //-------Simulacion del timer
                  if(pruebaTimer <= 1){
                    pruebaTimer++;
                    print('PruebaTimer = $pruebaTimer');
                  }else{
                    revisarTiempoDes = false; //Se termino el timer :v jaja
                    print('PruebaTimer = $pruebaTimer con tConcentracion $revisarTiempoDes');
                    pruebaTimer =0;
                  }
                  //-------
                });

              }

            }
            break;


            default: print('StartStatexD?');
            break; //por defecto no hace nada xd
          }
         

         },
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


 void _timerConcentracion(){


   setState(() {
     startState = 1;
     //1-Cuando aun no inicia el timer listo de Concentracion y esta habilitado
   });

   tConcentracionSeg = widget.tConcentracion * 60 ; //Se convierte a segundos

   Timer.periodic(Duration( seconds: 1), (Timer t){
     //Se crea una funcion periodica, la cual se repite cada segundo y recibe un
     //objeto de t de tipo timer para funcionar
     if( (tConcentracionSeg <1) || (revisarTiempoConcentracion == false) ){
       //Si no hay tiempo o si ya dejo de hacer la cuenta regresiva el timer
       t.cancel();
       revisarTiempoConcentracion = true; 
       tiempoPantalla = "00:00";
       startState = 3; //1-Cuando aun no inicia el timer listo de Concentracion y esta habilitado
      if (tConcentracionSeg<1 ){
        startState = 3;
      }

     }else if (tConcentracionSeg < 60){
      //Si hay menos de 60 segundos se muestra solo los segundos y decrementea el tiempo
       tiempoPantalla = "$tConcentracionSeg";
       tConcentracionSeg--;

     }else if(tConcentracionSeg < 3600){
       int m = tConcentracionSeg ~/ 60 ; //obtiene los minutos enteros
       int s = tConcentracionSeg -(60*m);//El resto de tiempo que no son minutos son los segundos
       tiempoPantalla = "$m:$s";
       tConcentracionSeg--; //Decrementa un segundo 


     }else{
       int h = tConcentracionSeg ~/3600;//Se obtienen las horas enteras  si asi lo desea xD
       int t = tConcentracionSeg - (3600*h);//Se calcula el tiempo restante
       int m = t ~/ 60; //obtiene los minutos enteros
       int s = t-(60*m); //El resto de tiempo que no son minutos son los segundos
       tiempoPantalla = '$h:$m:$s';
       tConcentracionSeg--; //Decrementa un segundo 
     }


    }
   );
 }



}//Class Aquadoro