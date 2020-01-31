import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;
  final TextInputType tipo;
  final TextEditingController textController;
  final FormFieldValidator validar;


  InputField({this.hint, this.obscure, this.icon, this.textController, this.validar, this.tipo = TextInputType.text});


  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      padding: EdgeInsets.only(
          top: 4.0,
          left: 16.0,
          right: 16.0,
          bottom: 4.0

      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(50)
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0
            )
          ]
      ),

      child: TextFormField(
        controller: textController,
        keyboardType: tipo,
        validator: validar,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            icon: Icon(
              icon,
              color: Colors.black45,
            )
        ),

        obscureText: obscure,
        style: TextStyle(
          color: Colors.black87,
        ),

      ),

    );
  }
}

