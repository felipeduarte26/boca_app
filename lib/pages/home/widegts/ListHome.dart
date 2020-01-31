import 'package:flutter/material.dart';


class ListHome extends StatelessWidget {

  final IconData ico;
  final String texto;
  final GestureTapCallback onTap;

  ListHome({this.texto, this.ico, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        ico,
        color :Colors.green,
      ),
      title: Text(texto),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }
}
