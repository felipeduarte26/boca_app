import 'package:flutter/material.dart';
import 'package:boca_app/pages/home/widegts/ListHome.dart';
import 'package:boca_app/pages/Info/widegts/ConfirmDialog.dart';


class InfoLegais extends StatelessWidget {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Informações Legais"),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body:Container(
        alignment: Alignment.center,
        //padding: EdgeInsets.only(top: 200.0, bottom: 300.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpg'),
            fit: BoxFit.none,
          ),
        ),

        child: Center(
          child: SizedBox(
            height: 200.0,
            child: Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: <Widget>[
                  ListHome(texto: "Autoria e Equipe", ico: Icons.record_voice_over, onTap: ()=> _OpenDialog(context, "Autoria e Equipe", "Em Manutenção")),
                  _buildDivider(),
                  ListHome(texto: "Direitos Legais", ico: Icons.gavel, onTap: ()=> _OpenDialog(context, "Direitos Legais", "Em Manutenção")),
                  _buildDivider(),
                  ListHome(texto: "Sobre o Produto", ico: Icons.new_releases, onTap: ()=> _OpenDialog(context, "Sobre o Produto", "Em Manutenção")),
                ],
              ),
            ),
          ),
        )
      ),
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
