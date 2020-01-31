import 'package:flutter/material.dart';
import 'package:boca_app/pages/home/widegts/ListHome.dart';
import 'package:boca_app/pages/Info/widegts/ConfirmDialog.dart';


class Funcionamento extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Informações de Funcionamento'),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body:Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 200.0, bottom: 300.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fundo.jpg'),
              fit: BoxFit.none,
            ),
          ),

          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                ListHome(texto: "Manuais", ico: Icons.book, onTap: ()=> _OpenDialog(context, "Manuais", "BLA BLA BLA BLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLA")),
                _buildDivider(),
                ListHome(texto: "Tutoriais", ico: Icons.check_circle, onTap: ()=> _OpenDialog(context, "Tutoriais", "BLA BLA BLA BLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLA")),
                _buildDivider(),
                ListHome(texto: "FAQ's", ico: Icons.search, onTap: ()=> _OpenDialog(context, "FAQ's", "BLA BLA BLA BLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLABLA BLA BLA")),
              ],
            ),
          ),
        )
    );

  }

  _OpenDialog(BuildContext context, String titulo, String texto){
    showDialog(context: context,
        builder: (BuildContext context){
          return ConfirmDialog (msg: texto ,
            titulo: titulo,
          );
        });
  }

  Container _buildDivider(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
