import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Progress_Indicator.dart';


class Loader extends StatelessWidget {

  final object;
  final Function callback;

  Loader({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {



    if(object == null)
      return Center(
        child: GenericProgressIndicator(),
      );

    if(object.length == 0)
      return Center(
        child: Text("Nenhum Objeto Encontrado"),
      );


      return callback();
  }
}

