import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
Color colorFondo =Colors.cyan[700] ;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          /*
          Container(
            height: 500,
            width: 500,
            child: FlareActor(
              'assets/LiquidLoader.flr',
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: 'Untitled',
              
            ),
          ),
          */
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Acuadoro.png'),
                fit: BoxFit.cover
              ),
            ),
          ),

/*
Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/assets/alucard.jpg'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    )
 */



          Container(height: 10),
          Center(
            child: SizedBox(
              width: 240.0,
              
              child: ColorizeAnimatedTextKit(
                speed: Duration(milliseconds: 300),
                totalRepeatCount: 1,
                onFinished: () => Navigator.pushReplacementNamed(context, 'goalsPage') ,
                text: [
                  "Acuadoro"
                ],
                textStyle: TextStyle(
                    fontSize: 45.0, 
                    // fontFamily: "Horizon"
                    fontWeight: FontWeight.bold,
                ),
                colors: [ 
                  Colors.blue[300],
                  Colors.lightBlue,
                  Colors.cyan[100],
                ],
                textAlign: TextAlign.center ,
                alignment: AlignmentDirectional.center // or Alignment.topLeft
              ),
            )
            
          ),
          
          
        ],
      )
    );
  }
  
}