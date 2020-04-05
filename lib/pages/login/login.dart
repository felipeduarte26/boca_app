import 'package:boca_app/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:boca_app/pages/login/widgets/topo.dart';
import 'package:flutter/services.dart';
import 'package:boca_app/pages/login/widgets/FormLogin.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';
import 'package:boca_app/pages/usuario/cadastroUsuario.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  @override
  void initState() {
    //Settings.user = null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return Scaffold(
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/fundo.jpg'), fit: BoxFit.none),),
          child: ListView(
            children: <Widget>[
              TopoLogin(),
              FormLogin(),
              InkWell(
                  onTap: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => CadUsuario())),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: const Text('Criar uma nova Conta?', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
                  )
              ),




            ],
          ),
        ),
      );

  }
}
_alertDialog(BuildContext context, String titulo, String msg){
  showDialog(context: context,
  builder:(BuildContext context){
     return BeautifulAlertDialog(titulo: titulo, msg: msg,);
    }
  );
}

void _portraitModeOnly() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

@override
void dispose() {
  _portraitModeOnly();
}
