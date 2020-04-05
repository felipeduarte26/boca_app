import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/login.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:boca_app/pages/login/widgets/AlignText.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
            seconds: 2,
            backgroundColor: Colors.white,
            navigateAfterSeconds: login(),
            loaderColor: Colors.transparent,
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("images/logo.png"), fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5.0)),
            AlignText(texto: 'Boca - APP', alinhamento: Alignment.bottomCenter, cor: Colors.black87, tamanoFonte: 16.7, fonte: FontWeight.bold, textoAlinhamento:  TextAlign.center),
            Padding(padding: EdgeInsets.only(top: 6.0)),
            AlignText(texto: 'Objetos em Audiodescrição para Pessoas com Deficiência Visual', alinhamento: Alignment.bottomCenter, cor: Colors.black87, tamanoFonte: 15.0, fonte: FontWeight.bold, textoAlinhamento: TextAlign.center),
          ],
        )
      ],
    );
  }
}
