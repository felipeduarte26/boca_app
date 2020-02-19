import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {

  final AnimationController controller;
  final double widthDevice;
  final Function validar;

  StaggerAnimation({this.controller, this.widthDevice, this.validar}):


        buttonSqueeze = Tween(
            begin: widthDevice,
            end: 70.0
        ).animate(
            CurvedAnimation(
                parent: controller,
                curve: Interval(0.0, 0.150)
            )
        );

  final Animation<double> buttonSqueeze;

  Widget _builderAnimation(BuildContext context, Widget child){

    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: InkWell(
        onTap: validar,
        child: Container(
          height: 70.0,
          width: buttonSqueeze.value,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.amber,// Color(0xff4169e1),
                  Colors.amber  //Color(0xff4682b4)
                ]
            ) ,
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
          ),
          child: Center(
              child: _buildInside(context)
          ),
        ),
      ),

    );
  }

  Widget _buildInside(BuildContext context){
    if(buttonSqueeze.value > 75){
      return  Text('Entrar', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold) ,);
    } else{
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        strokeWidth: 1.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _builderAnimation,
      animation: controller,
    );
  }
}
