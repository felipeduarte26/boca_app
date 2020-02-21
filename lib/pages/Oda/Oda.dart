import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:boca_app/settings.dart';
import 'package:boca_app/models/OdaModel.dart';
import 'widgets/ButtonAudio.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';

class Oda extends StatefulWidget {
  final OdaModel oda;

  AudioPlayer _audioPlayer = AudioPlayer();

  Oda({@required this.oda});


  @override
  _OdaState createState() => _OdaState();
}

class _OdaState extends State<Oda> {

  @override
  void initState() {
    widget._audioPlayer.pause();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose(){
    widget._audioPlayer.dispose();
    super.dispose();
  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
         title: Text(widget.oda.nome),
         centerTitle: true,
       ),
      body: SingleChildScrollView(
        child: Column(

          children: <Widget>[

            Container(

              height: 300.0,
              width: double.infinity,
              child: Image.network(Settings.urlOda+widget.oda.imagem, fit: BoxFit.fill,),
            ),

            Padding(padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),

              child: Column(


                children: <Widget>[

                  SizedBox(height: 20.0,),

                  Text(widget.oda.texto1 , textAlign: TextAlign.justify,),

                  SizedBox(height: 20.0,),

                  buttonAudio(texto: 'Nível Básico', ClickButton: () async{
                      widget._audioPlayer.pause();
                      int result = await widget._audioPlayer.play(Settings.urlOda+widget.oda.audio1, isLocal:  false);

                      if(result != 1){
                        AvisoAlert(context, "Não foi possível carregar o Áudio");
                      }
                    },
                  ),

                  SizedBox(height: 5.0,),

                  buttonAudio(texto: 'Nível Intermediário', ClickButton: ()async{

                    widget._audioPlayer.pause();
                    if(Settings.user != null){
                        int result = await widget._audioPlayer.play(Settings.urlOda+widget.oda.audio2, isLocal:  false);

                        if(result != 1){
                          AvisoAlert(context, "Não foi possível carregar o Áudio");
                        }

                      }else{
                        AvisoAlert(context, "Faça o Login para ter acesso aos níveis Intermediário e Avançado");
                      }
                    } ,
                  ),

                  SizedBox(height: 5.0,),

                  buttonAudio(texto: 'Nível Avançado', ClickButton: () async{
                    widget._audioPlayer.pause();
                    if(Settings.user != null){

                        int result = await widget._audioPlayer.play(Settings.urlOda+widget.oda.audio3, isLocal:  false);

                        if(result != 1){
                          AvisoAlert(context, "Não foi possível carregar o Áudio");
                        }

                      }else{
                       AvisoAlert(context, "Faça o Login para ter acesso aos níveis Intermediário e Avançado");
                      }
                    } ,
                  ),


                ],
              ),

            ),


          ],
        ),
      ),

    );
  }

 Future<Widget> AvisoAlert(BuildContext context, String texto){
    return  showDialog(context: context,
        builder: (BuildContext context){
          return  BeautifulAlertDialog(titulo: "Aviso", msg: texto);
        });
  }
}

