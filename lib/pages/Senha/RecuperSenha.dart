import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';
import 'package:boca_app/blocs/user.block.dart';
import 'package:boca_app/pages/usuario/widgets/Dialogs.dart';
class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {

  TextEditingController temail = TextEditingController();
  TextEditingController tsenha = TextEditingController();
  TextEditingController trepete_senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recuperar a Senha'),
        centerTitle: true,
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpg'),
            fit: BoxFit.none,
          ),
        ),

        child: ListView(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          children: <Widget>[
            Form(
              key: _formKey,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                     child: TextFormField(
                       validator: (texto){

                         if(texto.trim().isEmpty){
                           return 'Informe o seu e-mail';
                         }
                       },
                       controller: temail,
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.done,
                       decoration: InputDecoration(
                         labelText: 'E-mail',
                         hintText: 'Informe o E-mail do seu Cadastro',
                         icon: Icon(
                           Icons.email,
                           color: Colors.black45,
                         ),
                       ),
                     ),
                   ),

                   Container(
                     padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                     child: TextFormField(
                       validator: (texto){
                          if(texto.trim().isEmpty){
                            return 'Informe uma Nova Senha';
                          }
                       },
                       obscureText: true,
                       controller: tsenha,
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.done,
                       decoration: InputDecoration(
                         labelText: 'Senha',
                         hintText: 'Informe sua nova Senha',
                         icon: Icon(
                           Icons.vpn_key,
                           color: Colors.black45,
                         ),
                       ),
                     ),
                   ),

                   Container(
                     padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                     child: TextFormField(
                       validator: (texto){
                           if(texto.trim().isEmpty || texto == null){
                             return 'Dígite Novamente a sua Nova Senha';
                           }
                           },
                       obscureText: true,
                       controller: trepete_senha,
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.done,
                       decoration: InputDecoration(
                         labelText: 'Repetir Nova Senha',
                         hintText: 'Dígite Novamente a sua Nova Senha',
                         icon: Icon(
                           Icons.vpn_key,
                           color: Colors.black45,
                         ),
                       ),
                     ),
                   ),

                   SizedBox(height: 50.0,),

                   SizedBox(
                     width: double.infinity,
                     child: RaisedButton(
                       color: Colors.green,
                       onPressed: ()async{
                         trepete_senha.text = trepete_senha.text.trim();
                         tsenha.text = tsenha.text.trim();

                         if(trepete_senha.text == tsenha.text){

                             if(_formKey.currentState.validate()){
                               final UserBloc bloc =  new UserBloc();

                               var dados = new Map();

                               dados['email'] = temail.text;
                               dados['senha'] = tsenha.text;


                               Dialogs.showLoadingDialog(context, _keyLoader);

                               if( await bloc.Recuperar(dados)){
                                 Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BeautifulAlertDialog(
                                            titulo: "Aviso",
                                            msg: "Foi enviado um E-mail de Confirmando sua Alteração de Senha");
                                      });

                                }else{
                                 Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return BeautifulAlertDialog(
                                            titulo: "Aviso",
                                            msg: "E-mail não Encontrado");
                                      });
                                }
                             }

                         }else{
                           showDialog(
                               context: context,
                               builder: (BuildContext context) {
                                 return BeautifulAlertDialog(
                                     titulo: "Aviso",
                                     msg: "Senhas estão Diferentes");
                               });
                         }



                       },
                       child: Text(
                         'Enviar',
                         style: TextStyle(color: Colors.white),
                       ),
                     ),
                   ),
                 ],
               ),
            ),
          ],
        )
      ),
    );
  }
}
