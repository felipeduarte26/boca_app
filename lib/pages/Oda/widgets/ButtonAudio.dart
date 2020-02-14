import 'package:flutter/material.dart';


class buttonAudio extends StatelessWidget {

  final String texto;
  final Function ClickButton;

  buttonAudio({@required this.texto, this.ClickButton});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.green,
        onPressed: ClickButton,
        child: Text(texto,style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
