import 'package:flutter/material.dart';
import 'package:aquadoro/goal_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}//GoalsPage

class _GoalsPageState extends State<GoalsPage> with TickerProviderStateMixin {
//TickerProviderStateMixin Nos servira para agregarle animaciones a las tarjetas cuando son agregadas
  final List<GoalCard> _metas =[];
  int index;
  // final FocusNode _focusNode = new FocusNode( );

  @override
  Widget build(BuildContext context) { 
  
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
         fondoMetas(),
         

          Column(
          children: [
          
          SafeArea(child: _fadeText() ),
       
          Flexible(
            child:  ListView.builder(
              
            itemBuilder: (_ , int index){ 
              
              return Dismissible(
                key: new UniqueKey( )  , 
                child: _metas[index],

                background: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.only(left:10.0),
                  alignment: AlignmentDirectional.centerStart,
                  color: Colors.deepOrange[700],
                  child: Icon(Icons.delete_outline),
                ),

                onDismissed: (direccion){  
                  
                  setState(() {
                    
                      print(_metas[index].actividad);
                      
                      _metas.removeAt(index) ; 
                      print("Despues de eliminar") ;
                      print(_metas[index].actividad);
                    //  }
                    
                  });

                },
              );
            },    // => _metas[index],

            reverse: false,//permite que se vea la animacion bonita como en chat
            // padding: EdgeInsets.all(2.0),
            itemCount: _metas.length,
            
           ),
          ),
             
          FloatingActionButton(
            
            onPressed: (){
              _agregarCard(); 
            },
            child: Icon(
            Icons.add_circle_outline ,
            color: Colors.cyan[200] ,
            size: 50.0,
            ),
          ),
          Container(height: 10)
        ],
        )
          //Colum metas Listview.builder
 
        ],
      ),
  
    );

  }//build

  Widget fondoMetas() {
    return Container(
     decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: <Color>[
          // Colors.lightBlue[400] ,
          Colors.cyan[700],
          Colors.cyan[600],
        ]
      )
     ),
    );
  } 

  Widget _fadeText() {
    return  Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top:12.0) ,
      child: SizedBox(
        width: 350.0,
        height: 65.0,
        child: FadeAnimatedTextKit(
          repeatForever: true,
          
          text: [
            "¿Que es lo realmente importante?",
            "¿Que cosa si la haces ahora te haria sentir mucho mejor?",
            "Vamos a Hacerlo :)",
          ],
          textStyle: TextStyle(
              fontSize: 25.0, 
              fontWeight: FontWeight.w600 ,
              // fontFamily: ,
              color: Colors.blueGrey[50],
          ),
          textAlign: TextAlign.center,
          alignment: AlignmentDirectional.center, // or Alignment.topLeft
        ),
      ),
    );
  }


  Widget _agregarCard( ){
    final animacionCards = new AnimationController(
        duration: const Duration(milliseconds: 260),
        vsync: this, //necesario para el tricker, impulsa la animacion hacia delante
    );
    GoalCard meta = new GoalCard(
      animationController : animacionCards,
      // actividad: 'Correr',
    );
    

    setState(() {

      _metas.insert(_metas.length, meta);

    });

    meta.animationController.forward();
    
  
  }


  @override
  void dispose(){//Liberar recuros de memoria que se usa en las animaicones
    for(GoalCard meta in _metas)
      meta.animationController.dispose();
    super.dispose();
  }
  
 
}//_GoalsPageState