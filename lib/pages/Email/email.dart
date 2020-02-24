import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/models/EmailModel.dart' as Femail;
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';
import 'package:boca_app/pages/usuario/widgets/Dialogs.dart';

class email extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final Femail.email e_mail = Femail.email();

  TextEditingController _controllerEmail = new TextEditingController();
  TextEditingController _controllerNome = new TextEditingController();
  TextEditingController _controllerTexto = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fale Conosco"),
        centerTitle: true,
      ),
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
                  const SizedBox(height: 30.0),
                  TextFormField(
                    validator: (texto) {
                      if (texto.trim().isEmpty) {
                        return 'Informe o Seu Nome';
                      } else
                        return null;
                    },
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: "Nome",
                        hintText: "Informe o seu nome",
                        icon: Icon(
                          Icons.person,
                          color: Colors.black45,
                        )),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    validator: (texto) {
                      if (texto.trim().length < 3 || !texto.contains('@')) {
                        return 'Informe o Seu e-mail';
                      } else
                        return null;
                    },
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: "e-mail",
                        hintText: "Dígite o seu e-mail",
                        icon: Icon(
                          Icons.email,
                          color: Colors.black45,
                        )),
                  ),
                  const SizedBox(height: 30.0),
                  Container(
                    color: Colors.white,
                    child: TextField(
                      controller: _controllerTexto,
                      textInputAction: TextInputAction.done,
                      textAlign: TextAlign.start,
                      minLines: 5,
                      maxLength: 300,
                      decoration: new InputDecoration(
                        contentPadding: EdgeInsets.all(30.0),
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                      ),
                      autocorrect: true,
                      style: TextStyle(height: 2.0),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: () async{

                        if (_formKey.currentState.validate()) {

                          Dialogs.showLoadingDialog(context, _keyLoader);//invoking login

                          e_mail.Nome = _controllerNome.text;
                          e_mail.Email = _controllerEmail.text;
                          e_mail.Texto = _controllerTexto.text;

                            if(await e_mail.enviar()){
                              _controllerNome.text = "";
                              _controllerEmail.text = "";
                              _controllerTexto.text = "";
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
        ),
      ),
    );
  }
}
