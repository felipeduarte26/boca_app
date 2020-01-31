import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boca_app/pages/login/widgets/AlignText.dart';

class TopoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:  MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: 80),
              child: Image.asset(
                "images/logo.png",
                width: 350,
                height: 130,
                fit: BoxFit.contain,
              ),
            ),
          ),

          Padding(padding: EdgeInsets.only(top: 15.0)),
          AlignText(texto: 'Boca - APP', alinhamento: Alignment.bottomCenter, cor: Colors.black87, tamanoFonte: 16.7, fonte: FontWeight.bold, textoAlinhamento:  TextAlign.center),
          Padding(padding: EdgeInsets.only(top: 6.0)),
          AlignText(texto: 'Objetos em Audiodescrição para Pessoas com Deficiência Visual', alinhamento: Alignment.bottomCenter, cor: Colors.black87, tamanoFonte: 15.0, fonte: FontWeight.bold, textoAlinhamento: TextAlign.center),
        ],
      ),
    );
  }
}
