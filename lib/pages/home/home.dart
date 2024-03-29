import 'package:boca_app/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/pages/home/widegts/AnimatedBottomNav.dart';
import 'package:boca_app/pages/home/widegts/ListHome.dart';
import 'package:boca_app/pages/Info/informacoesLegais.dart';
import 'package:boca_app/pages/funcionamento/funcionamento.dart';
import 'package:boca_app/pages/Email/email.dart';
import 'package:boca_app/pages/Status/Status.dart';
import 'package:boca_app/pages/Oda/OdaTexto.dart';
import 'package:boca_app/pages/busca/BuscaOda.dart';
import 'package:boca_app/pages/login/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage;

  @override
  void initState() {
    _currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seja Bem-vindo'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              if(Settings.user != null){

                setState(() {
                  Settings.user = null;
                });

              }
            },
            child: Settings.user != null ? Icon(Icons.exit_to_app) : Text('(Desconectado)', style: TextStyle(color: Colors.red.shade100, fontStyle: FontStyle.italic), ),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      body: getPage(_currentPage),
      bottomNavigationBar: AnimatedBottomNav(
          currentIndex: _currentPage,
          onChange: (index) {
            setState(() {
              _currentPage = index;
            });
          }),
    );
  }

  DecorationImage _GetBackGround() {
    return DecorationImage(
      image: AssetImage('images/fundo.jpg'),
      fit: BoxFit.none,
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }

  getPage(int page) {
    switch (page) {
      case 0: //Buscar
       return BuscaOda();

      case 1: //Login
        return login();

      case 2: //Informacoes
        return  Container(
            padding: EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              image: _GetBackGround(),
            ),
            child: Center(
              child:  SizedBox(
                height: 210.0,
                child: Card(
                  elevation: 5.0,
                  //margin: EdgeInsets.all(10.0),
                  //margin: EdgeInsets.only(bottom: 200.0, top: 200.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListHome(
                          texto: "Informações Legais",
                          ico: Icons.announcement,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => InfoLegais()))),
                      _buildDivider(),
                      ListHome(
                          texto: "Informações de Funcionamento",
                          ico: Icons.info,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Funcionamento()))),
                      _buildDivider(),
                      ListHome(
                          texto: "Fale Conosco",
                          ico: Icons.phone,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => email()))),
                    ],
                  ),
                ),
              )

            ),
        );

      case 3: //adm
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(32.0),
          decoration: BoxDecoration(
            image: _GetBackGround(),
          ),
          child: Center(
            child: SizedBox(
              height: 150.0,
              child: Card(
                elevation: 4.0,
                //margin: const EdgeInsets.fromLTRB(32.0, 58.0, 32.0, 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ListHome(
                        texto: "Objeto",
                        ico: Icons.image,
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Listar()))),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => OdaTexto()))),
                        //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Descricao()))),
                    _buildDivider(),
                    ListHome(
                        texto: "Alterar Perfil",
                        ico: Icons.contact_mail,
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Status()))),

                  ],
                ),
              ),
            ),
          )
        );
    }
  }
}
