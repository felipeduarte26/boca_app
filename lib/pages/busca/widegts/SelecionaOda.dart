import 'package:flutter/material.dart';
import 'package:boca_app/models/OdaModel.dart';
import 'package:boca_app/pages/busca/widegts/Loader.dart';


class SelecionaOda extends StatelessWidget {

  final List<OdaModel> oda;


  SelecionaOda({@required this.oda});

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
                ListTile(
                   title: Text(oda[index].nome, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                   trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                   onTap: (){}
                ),

                ],
              ),
            ),


          );
        }
    );
  }

}

