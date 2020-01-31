import 'package:flutter/material.dart';

class userImputField extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;
  final TextInputType tipo;
  final TextEditingController textController;
  final FormFieldValidator validar;
  final String texto;

  userImputField({this.hint, this.obscure, this.icon, this.textController, this.validar, this.texto, this.tipo = TextInputType.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
      child: TextFormField(

          controller: textController,
          keyboardType: tipo,
          validator: validar,

          textInputAction: TextInputAction.done,
           decoration: InputDecoration(
               labelText: texto,
           hintText: hint,
              icon: Icon(
              icon,
              color: Colors.black45,
            )
        ),
        obscureText: obscure,
      ),
    );
  }
}
