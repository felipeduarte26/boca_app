import 'package:boca_app/settings.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/pages/home/widegts/ListHome.dart';
import 'package:boca_app/models/EmailModel.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';
import 'package:boca_app/pages/usuario/widgets/Dialogs.dart';


class Status extends StatefulWidget {
  @override
  _StatusState createState() => _StatusState();
}

class _StatusState extends State<Status> {
  final email e_mail = email();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Alterar Perfil'),
          centerTitle: true,
        ),
        backgroundColor: Colors.transparent,
        body:Container(
            alignment: Alignment.center,
          //padding: EdgeInsets.only(top: 90.0, bottom: 220.0),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('images/fundo.jpg'), fit: BoxFit.none,),
          ),

          child: Center(
            child: SizedBox(
              height: 400.0,
              child: Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(32.0, 20.0, 32.0, 20.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListHome(texto: "Administrador", ico: Icons.email, onTap: ()=> _ValidarOpacao(1) ),
                    _buildDivider(),
                    ListHome(texto: "Avaliador", ico: Icons.email, onTap: ()=> _ValidarOpacao(2)),
                    _buildDivider(),
                    ListHome(texto: "Cadastrador", ico: Icons.email, onTap: ()=> _ValidarOpacao(3)),
                    _buildDivider(),
                    ListHome(texto: "Capacitador", ico: Icons.email, onTap: ()=> _ValidarOpacao(4)),
                    _buildDivider(),
                    ListHome(texto: "Padrão", ico: Icons.email, onTap: ()=> _ValidarOpacao(5)),
                    _buildDivider(),
                    ListHome(texto: "Revisor", ico: Icons.email, onTap: ()=> _ValidarOpacao(6)),
                  ],
                ),
              ),
            ),
          )
        )
    );
  }

  _ValidarOpacao(int index){

    switch (index) {
      case 1:_enviarEmail("Administrador");
      break;

      case 2:_enviarEmail("Avaliador");
      break;

      case 3:_enviarEmail("Cadastrador");
      break;

      case 4:_enviarEmail("Capacitador");
      break;

      case 5:_enviarEmail("Padrão");
      break;

      case 6:_enviarEmail("Revisor");
      break;

    }

  }

  void _enviarEmail(String Perfil) async{

    if(Settings.user != null){

      if(Settings.user.perfil.trim().contains(Perfil.trim()) == false){

          try{
            Dialogs.showLoadingDialog(context, _keyLoader);

            e_mail.Nome = Settings.user.nome;
            e_mail.Email = Settings.user.email;
            e_mail.Texto = "Alterar para o Perfil ${Perfil}";

            if(await e_mail.enviar()){

              Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BeautifulAlertDialog(
                        titulo: "Aviso",
                        msg: "E-mail Enviado com Sucesso");
                  });
            }else{
              Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BeautifulAlertDialog(
                        titulo: "Aviso",
                        msg: "Ocorreu um erro ao tentar enviar o E-mail");
                  });
            }

          }catch(error){
            Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();

            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return BeautifulAlertDialog(
                      titulo: "Aviso",
                      msg: error);
                });
          }
      }else{
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return BeautifulAlertDialog(
                  titulo: "Aviso",
                  msg: "Usuário já Consta no Perfil Selecionado");
            });
      }

    }else{
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return BeautifulAlertDialog(
                titulo: "Aviso",
                msg: "Faça o seu Login");
          });
    }

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
