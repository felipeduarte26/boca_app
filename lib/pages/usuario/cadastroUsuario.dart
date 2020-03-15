import 'package:flutter/material.dart';
import 'package:boca_app/pages/usuario/widgets/userInputField.dart';
import 'package:boca_app/models/UserModel.dart';
import 'package:boca_app/pages/usuario/widgets/Dialogs.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';

class CadUsuario extends StatefulWidget {
  @override
  _CadUsuarioState createState() => _CadUsuarioState();
}

class _CadUsuarioState extends State<CadUsuario> {

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  TextEditingController _ControllerNome = TextEditingController();
  TextEditingController _ControllerEmail = TextEditingController();
  TextEditingController _ControllerUsuario = TextEditingController();
  TextEditingController _ControllerSenha = TextEditingController();
  TextEditingController _ControllerSenha2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastro de Usuário',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  userImputField(
                    texto: "Nome",
                    hint: 'Informe o Nome do Usuário',
                    textController: _ControllerNome,
                    tipo: TextInputType.text,
                    obscure: false,
                    icon: Icons.person,
                    validar: (texto) {
                      if (texto.toString().trim().isEmpty) {
                        return "você precisa informar um nome";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  userImputField(
                    texto: "E-mail",
                    hint: 'Informe o e-mail do usuário',
                    textController: _ControllerEmail,
                    icon: Icons.email,
                    obscure: false,
                    tipo: TextInputType.emailAddress,
                    validar: (texto) {
                      if (texto.toString().trim().isEmpty) {
                        return 'você precisa informar um e-mail';
                      } else
                        return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  userImputField(
                    texto: "Login",
                    hint: 'Informe um login para o usuário',
                    textController: _ControllerUsuario,
                    icon: Icons.account_circle,
                    obscure: false,
                    tipo: TextInputType.text,
                    validar: (texto) {
                      if (texto.toString().trim().isEmpty) {
                        return 'Informe um nome de usuário';
                      } else
                        return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  userImputField(
                    texto: "Senha",
                    hint: 'Informe uma Senha',
                    textController: _ControllerSenha,
                    icon: Icons.vpn_key,
                    obscure: false,
                    tipo: TextInputType.text,
                    validar: (texto) {
                      if (texto.toString().trim().isEmpty) {
                        return 'Informe a senha do Login';
                      } else
                        return null;
                    },
                  ),
                  const SizedBox(height: 16.0),
                  userImputField(
                    texto: "Informe Novamente a Senha",
                    hint: 'Repita novamente a Senha',
                    textController: _ControllerSenha2,
                    icon: Icons.vpn_key,
                    obscure: false,
                    tipo: TextInputType.text,
                    validar: (texto) {
                      if (texto.toString().trim().isEmpty) {
                        return 'Repita novamente uma Senha';
                      } else if(texto.toString().trim() != _ControllerSenha.text){
                        return 'Senha são diferentes';
                      }else
                        return null;
                    },
                  ),
                  SizedBox(height: 50.0,),

                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: cadastrar,
                      child: Text(
                        'Salvar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  cadastrar() async{

    if(_formKey.currentState.validate()){

      _formKey.currentState.save();

      Dialogs.showLoadingDialog(context, _keyLoader);//invoking login

      final UserModel user = UserModel(nome: _ControllerNome.text.trim(), login: _ControllerUsuario.text.trim(), senha: _ControllerSenha.text.trim(),
            email:_ControllerEmail.text.trim(), perfil: "Padrão", senha2: _ControllerSenha2.text.trim(), sId: null);

        if(await user.CreateUser()){
          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BeautifulAlertDialog(
                    titulo: "Aviso",
                    msg: "Cadastro realizado com sucesso");
              });


        }else{
          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return BeautifulAlertDialog(
                    titulo: "Aviso",
                    msg: "Ocorreu um erro ao tentar cadastrar um usuário");
              });
        }



    }
  }
}








