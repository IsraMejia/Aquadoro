import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
Color colorFondo =Color.fromRGBO(3, 75, 135,1) ;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorFondo,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
          Divider(height: 20),
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
                    fontSize: 50.0, 
                    // fontFamily: "Horizon"
                    fontWeight: FontWeight.bold,
                ),
                colors: [ 
                  Colors.blue[300],
                  Colors.blueAccent,
                  Colors.lightBlue,
                  Colors.blue[900],
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