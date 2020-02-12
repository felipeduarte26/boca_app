import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:boca_app/settings.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';

class Oda extends StatefulWidget {
  final String img;
  final String texto1;
  final String texto2;
  final String texto3;
  final String audio1;
  final String audio2;
  final String audio3;
  final String nome;

  AudioPlayer _audioPlayer = AudioPlayer();


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
  void dispose(){
    print("destruiu");
    widget._audioPlayer.dispose();
    super.dispose();
  }

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
              child: Image.network(Settings.urlOda+widget.img, fit: BoxFit.fill,),
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
                      onPressed: () async{
                          int result = await widget._audioPlayer.play(Settings.urlOda+widget.audio1, isLocal:  false);
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
                      onPressed: () async{

                        if(Settings.user != null){
                          int result = await widget._audioPlayer.play(Settings.urlOda+widget.audio2, isLocal:  false);
                        }else{
                          AvisoAlert(context);
                        }


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
                      onPressed: () async{
                        if(Settings.user != null){
                          int result = await widget._audioPlayer.play(Settings.urlOda+widget.audio3, isLocal:  false);
                        }else{
                          AvisoAlert(context);
                        }

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

 Future<Widget> AvisoAlert(BuildContext context){
    return  showDialog(context: context,
        builder: (BuildContext context){
          return  BeautifulAlertDialog(titulo: "Aviso", msg: "Faça o Login para ter acesso aos níveis Intermediários e avançado");
        });
  }
}

