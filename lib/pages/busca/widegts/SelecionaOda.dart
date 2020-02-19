import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/models/OdaModel.dart';
import 'package:boca_app/pages/busca/widegts/Loader.dart';
import 'package:boca_app/pages/Oda/Oda.dart';

class SelecionaOda extends StatelessWidget {
  final List<OdaModel> oda;

  final String filtrar;

  SelecionaOda({@required this.oda, @required this.filtrar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: Loader(
        object: oda,
        callback: list,
      ),
    );
  }

  Widget list(){

    return ListView.builder(
        itemCount: oda.length,
        itemBuilder: (context, index){

          return Padding(
            padding: EdgeInsets.all(2),
            child: Card(
              color: Colors.green.shade800,
              elevation: 5.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  FiltroLista(context, index),

                ],
              ),
            ),


          );
        }
    );
  }

  Widget FiltroLista(BuildContext context, int index) {
    if (filtrar == null || filtrar.trim().isEmpty) {
      return ListTile(
          title: Text(
            oda[index].nome,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Oda(
                          oda: oda[index],
                        )));
          });
    } else {
      if (oda[index].nome.contains(filtrar)) {
        return ListTile(
            title: Text(
              oda[index].nome,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Oda(
                            oda: oda[index],
                          )));
            });
      } else {
        return SizedBox(
          height: 0.0,
          width: 0.0,
        );
      }
    }
  }
}
