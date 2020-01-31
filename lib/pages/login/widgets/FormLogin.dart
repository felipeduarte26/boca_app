import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/widgets/InputField.dart';
import 'package:boca_app/pages/login/widgets/stragger_animation.dart';
import 'package:boca_app/pages/home/home.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin>
 with SingleTickerProviderStateMixin{

  final _formKey = GlobalKey<FormState>();
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()));
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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 350,
            padding: EdgeInsets.only(top: 50),
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
                      }
                      return null;
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
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30.0,),
                  StaggerAnimation(
                    controller: _animationController.view,
                    widthDevice: MediaQuery.of(context).size.width / 1.2,
                    validar: (){
                      if(_formKey.currentState.validate()){
                        _animationController.forward();
                      }
                    },
                  ),
                  const SizedBox(height: 20.0,),
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                              Colors.blue,
                              Colors.black
                            ],
                        ) ,
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Center(
                          child: Text('Visitante (Entrar sem Cadastro)', style: TextStyle(color:  Colors.white, fontWeight: FontWeight.bold) ,),
                      ),
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
}
