import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class GoalsPage extends StatefulWidget {
  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _fadeText(),
      ),
      body:Column(
        children: <Widget>[
          
          Divider()
        


        ],
      ) ,
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