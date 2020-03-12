import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';
import 'package:boca_app/blocs/user.block.dart';
class RecuperarSenha extends StatefulWidget {
  @override
  _RecuperarSenhaState createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {

  TextEditingController temail = TextEditingController();
  TextEditingController tsenha = TextEditingController();
  TextEditingController trepete_senha = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                         hintText: 'Informe o seu e-mail',
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
                            return 'Informe a Senha';
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
                           if(tsenha.text.trim().toUpperCase() != trepete_senha.text.trim().toUpperCase()){

                             showDialog(
                                 context: context,
                                 builder: (BuildContext context) {
                                   return BeautifulAlertDialog(
                                       titulo: "Aviso",
                                       msg: "Senha Diferente das Senhas Informada");
                                 });
                           }

                         },
                       obscureText: true,
                       controller: trepete_senha,
                       keyboardType: TextInputType.emailAddress,
                       textInputAction: TextInputAction.done,
                       decoration: InputDecoration(
                         labelText: 'Escreva Novamente sua Mova Senha',
                         hintText: 'Informe sua nova Senha',
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
                       onPressed: (){

                         showDialog(
                             context: context,
                             builder: (BuildContext context) {
                               return BeautifulAlertDialog(
                                   titulo: "Aviso",
                                   msg: "Senha atualizada com sucesso");
                             });

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
