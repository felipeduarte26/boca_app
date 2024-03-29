import 'package:boca_app/models/authenticate_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boca_app/pages/login/widgets/InputField.dart';
import 'package:boca_app/pages/login/widgets/stragger_animation.dart';
import 'package:boca_app/blocs/user.block.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';
import 'package:boca_app/settings.dart';
import 'package:boca_app/pages/home/home.dart';
import 'package:boca_app/pages/Senha/RecuperSenha.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin>
 with SingleTickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  final  controllerUsuario = TextEditingController();
  final controllerSenha = TextEditingController();

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
    controllerUsuario.dispose();
    controllerSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    textController: controllerUsuario,
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
                  const SizedBox(height: 15.0,),
                  InputField(
                    textController: controllerSenha,
                    hint: 'Senha',
                    obscure: true,
                    icon: Icons.lock,
                    validar: (texto){

                      if(texto.toString().trim().isEmpty){
                        return "Informe a Senha";
                      }else{
                        senha = texto.toString().trim();
                        return null;
                      }

                    },
                  ),
                  const SizedBox(height: 20.0,),

                  StaggerAnimation(
                    cor: Colors.amber,
                    controller: _animationController.view,
                    widthDevice: MediaQuery.of(context).size.width / 1.2,
                    validar: () async{

                      if(Settings.user == null){

                        if(_formKey.currentState.validate()){
                          _formKey.currentState.save();

                          _animationController.forward();

                          if(await authenticate(context)){
                            _animationController.reset();
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                          }else{
                            showDialog(context: context,
                                builder: (BuildContext context){
                                  return  BeautifulAlertDialog(titulo: "Aviso", msg: "Usuário ou Senha Incorreta");
                                });

                            login = null;
                            senha = null;
                          }
                        }
                      }else{
                        setState(() {
                          Settings.user = null;
                        });

                      }


                    },
                  ),

                  const SizedBox(height: 15.0,),
                  InkWell(
                    onTap: (){
                      Settings.user = null;
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade800 ,// Color(0xff4169e1),
                              Colors.blue  //Color(0xff4682b4)
                            ]
                        ) ,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      alignment: Alignment.center,
                      width:  MediaQuery.of(context).size.width / 1.2,
                      height: 60.0,
                      child: Text("Entrar como Visitante", style: TextStyle(color: Colors.white), textAlign: TextAlign.center, ),
                    ),
                  ),
                  SizedBox(height: 20.0,),

                  InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => RecuperarSenha())),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      child: const Text('Esqueci minha Senha', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

Future<bool> authenticate(BuildContext context) async{
    final UserBloc bloc =  new UserBloc();
    Settings.user = null;

    var user = await bloc.authenticate(
      new AuthenticateModel(
        login: login,
        senha: senha
      ),
    );

    if(user != null){
      Settings.user = user;
    }

    return (user != null);

  }
}
