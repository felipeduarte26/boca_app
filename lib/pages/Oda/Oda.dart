import 'package:flutter/material.dart';

class Oda extends StatefulWidget {
  final String img;
  final String texto1;
  final String texto2;
  final String texto3;
  final String audio1;
  final String audio2;
  final String audio3;
  final String nome;

  Oda({@required this.img,
       @required this.texto1,
       @required this.texto2,
       @required this.texto3,
       @required this.audio1,
       @required this.audio2,
       @required this.audio3,
       @required this.nome}
       );

  @override
  _OdaState createState() => _OdaState();
}

class _OdaState extends State<Oda> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text(widget.nome),
       ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network("https://img.ibxk.com.br/2019/10/29/flutter-29101357380259.jpg?w=328", fit: BoxFit.fill,),
            ),

            Padding(padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  Text(widget.texto1 , textAlign: TextAlign.justify,),
                  SizedBox(height: 20.0,),

                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: (){

                      },
                      child: Text('Tocar',style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0,),

                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: (){

                      },
                      child: Text('Nível Básico',style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(height: 5.0,),

                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      color: Colors.green,
                      onPressed: (){

                      },
                      child: Text('Nível Avançado',style: TextStyle(color: Colors.white),
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

