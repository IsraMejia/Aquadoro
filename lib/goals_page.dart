import 'package:flutter/material.dart';
import 'package:aquadoro/goal_card.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}//GoalsPage

class _GoalsPageState extends State<GoalsPage> {

  final List<GoalCard> _metas =[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _fadeText(),
      ),
      body:SingleChildScrollView( //Para que no haya problema con el teclado
          child: ListView.builder(
            itemBuilder: (_ , int index) => _metas[index],
            // reverse: true,
            padding: EdgeInsets.all(5.0),
            itemCount: _metas.length,
          ), 
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(
         Icons.add_circle_outline ,
         color: Color.fromRGBO(42, 229, 186, 0.9),
        ),
      ),
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
        alignment: AlignmentDirectional.center // or Alignment.topLeft
      ),
    );
  }


  

}//_GoalsPageState