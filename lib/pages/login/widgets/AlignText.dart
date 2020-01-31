import 'package:flutter/material.dart';

class AlignText extends StatelessWidget {

  final String texto;
  final Color cor;
  final FontWeight fonte;
  final double tamanoFonte;
  final TextAlign textoAlinhamento;
  final Alignment alinhamento;

  AlignText({this.texto, this.cor, this.fonte, this.tamanoFonte, this.alinhamento, this.textoAlinhamento});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alinhamento,
      child: Text( texto,
        style: TextStyle(
            color: cor,
            fontWeight: fonte,
            fontSize: tamanoFonte),
        textAlign: textoAlinhamento,
      ),
    );
  }
}
