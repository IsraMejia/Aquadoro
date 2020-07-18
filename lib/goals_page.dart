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
  // final FocusNode _focusNode = new FocusNode( );

  @override
  Widget build(BuildContext context) { 
    
    return Scaffold(
      appBar: AppBar(
        title: _fadeText(),
      ),
      body: Column(
        children: [
       
          Flexible(
            child:  ListView.builder(
            itemBuilder: (_ , int index){
              
              return Dismissible(
                key: new UniqueKey( )  , 
                child: _metas[index],

                background: Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.only(left:15.0),
                  alignment: AlignmentDirectional.centerStart,
                  color: Colors.deepOrange[700],
                  child: Icon(Icons.delete_outline),
                ),

                onDismissed: (direccion){  
                  
                  setState(() {
                    //  if(_metas.length > 0){
                      print(_metas[index].actividad);
                      //print(_metas[index+1].actividad);
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
         color: Color.fromRGBO(142, 229, 186, 0.6),
         size: 50.0,
        ),
      ),
     ],
      )
    );

  }//build

  Widget _fadeText() {
    return  SizedBox(
      width: 350.0,
      child: FadeAnimatedTextKit(
        repeatForever: true,
        onTap: () {
            print("Tap Event");
          },
        text: [
          "¿Que es lo realmente",
          " importante?",
          "¿Que cosa si la haces ahora",
          "te haria sentir mucho mejor?",
          "Vamos a Hacerlo :)",
        ],
        textStyle: TextStyle(
            fontSize: 25.0, 
            fontWeight: FontWeight.normal
        ),
        textAlign: TextAlign.center,
        alignment: AlignmentDirectional.center, // or Alignment.topLeft
      ),
    );
  }


  void _agregarCard(){
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
    // print('se creo tarjeta de meta');
    //  _focusNode.requestFocus(); 

  
  }


  @override
  void dispose(){//Liberar recuros de memoria que se usa en las animaicones
    for(GoalCard meta in _metas)
      meta.animationController.dispose();
    super.dispose();
  }
  
 
}//_GoalsPageState