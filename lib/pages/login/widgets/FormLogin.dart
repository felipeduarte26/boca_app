import 'dart:math';
import 'package:boca_app/models/authenticate_user.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/widgets/InputField.dart';
import 'package:boca_app/pages/login/widgets/stragger_animation.dart';
import 'package:boca_app/pages/usuario/cadastroUsuario.dart';
import 'package:provider/provider.dart';
import 'package:boca_app/blocs/user.block.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';


class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin>
 with SingleTickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();

  AnimationController _animationController;
  var login = '';
  var senha = '';

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {

      if (status == AnimationStatus.completed) {
        _animationController.reset();

      }

    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('images/fundo.jpg'), fit: BoxFit.none),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 350,
            padding: EdgeInsets.only(top: 5.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  InputField(
                    hint: 'Login',
                    obscure: false,
                    icon: Icons.person,
                    validar: (texto) {

                      if (texto.toString().trim().isEmpty) {
                        return "Informe o Login";
                      }else{
                        login = texto.toString().trim();
                        return null;
                      }

                    },
                    tipo: TextInputType.text,
                  ),
                  const SizedBox(height: 20.0,),
                  InputField(
                    hint: 'Senha',
                    obscure: true,
                    icon: Icons.lock,
                    validar: (texto){

                      if(texto.toString().trim().isEmpty){
                        return "Informe a Senha";
                      }else{
                        //senha = texto.toString().trim();
                        return null;
                      }

                    },
                  ),
                  const SizedBox(height: 30.0,),
                  StaggerAnimation(
                    controller: _animationController.view,
                    widthDevice: MediaQuery.of(context).size.width / 1.2,
                    validar: (){

                      if(_formKey.currentState.validate()){
                        _formKey.currentState.save();

                        _animationController.forward();
                        authenticate(context);

                      }
                    },
                  ),
                  const SizedBox(height: 50.0,),
                  InkWell(
                    onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => CadUsuario())),
                    child: const Text('Criar uma nova Conta?', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  authenticate(BuildContext context) async{
    var bloc = new UserBloc();
    //var bloc = Provider.of<UserBloc>(context, listen: false);

    var user = await bloc.authenticate(
      new AuthenticateModel(
        login: login,
        senha: senha
      ),
    );


    if(user != null){
      showDialog(context: context,
          builder: (BuildContext context){
            return  BeautifulAlertDialog(titulo: "Aviso", msg: "Usuário Logado com Sucesso");

      });


    }else{
      showDialog(context: context,
          builder: (BuildContext context){
            return  BeautifulAlertDialog(titulo: "Aviso", msg: "Usuário ou Senha Incorreta");
          });
      login = null;
      senha = null;
    }



  }
}
