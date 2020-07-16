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
            itemBuilder: (_ , int index) => _metas[index],
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
         color: Color.fromRGBO(42, 229, 186, 0.9),
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
        duration: const Duration(milliseconds: 500), 
        vsync: this, //necesario para el tricker, impulsa la animacion hacia delante
    );
    GoalCard meta = new GoalCard(
      animationController : animacionCards,
    );

    setState(() {
      _metas.insert(0, meta);
      
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