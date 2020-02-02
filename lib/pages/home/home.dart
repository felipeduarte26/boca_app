import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/pages/home/widegts/AnimatedBottomNav.dart';
import 'package:boca_app/pages/home/widegts/QuestionDialog.dart';
import 'package:boca_app/pages/login/login.dart';
import 'package:boca_app/pages/home/widegts/ListHome.dart';
import 'package:boca_app/pages/Info/informacoesLegais.dart';
import 'package:boca_app/pages/funcionamento/funcionamento.dart';
import 'package:boca_app/pages/Email/email.dart';

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
      ),
      backgroundColor: Colors.transparent,
      body: getPage(_currentPage),
      bottomNavigationBar: AnimatedBottomNav(
          currentIndex: _currentPage,
          onChange: (index) {
              setState(() {
                _currentPage = index;
                if(index == 1){
                  showDialog(context: context,
                      builder: (BuildContext context){
                    return QuestionDialog(msg: "Deseja Realmente sair do Boca-App",
                        titulo: 'Aviso',
                        YesOptions: ()=>  Navigator.push(context, MaterialPageRoute(builder: (context) => login())),
                        NoOptions: ()=> Navigator.pop(context));
                  });

                }
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

  Container _buildDivider(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }

  getPage(int page) {
    switch (page) {
      case 0://Buscar
        return Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image: _GetBackGround(),
          ),
        );
      case 1://Login
        return Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image: _GetBackGround(),
          ),

        );
      case 2://Informacoes
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 200.0, bottom: 250.0),
          decoration: BoxDecoration(
            image: _GetBackGround(),
          ),
          child: Card(
            elevation: 4.0,
            margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[

                ListHome(texto: "Informações Legais", ico: Icons.announcement, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => InfoLegais()))),
                _buildDivider(),
                ListHome(texto: "Informações de Funcionamento", ico: Icons.info, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => Funcionamento()))),
                _buildDivider(),
                ListHome(texto: "Fale Conosco", ico: Icons.phone, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => email()))),
              ],
            ),
          ),
        );



      case 3://Dados
        return Container(
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            image:_GetBackGround(),
          ),
        );
    }
  }
}


