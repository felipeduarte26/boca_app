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
  String texto = null;
  int nivel = 1;

  @override
  void initState() {
    widget._audioPlayer.pause();

    if (texto == null) {
      texto = widget.oda.texto1;
    }

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
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
              child: Image.network(
                Settings.urlOda + widget.oda.imagem,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    texto,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      buttonAudio(
                        texto: 'Nível Básico',
                        ClickButton: () {
                          nivel = 1;
                          widget._audioPlayer.pause();

                          setState(() {
                            texto = widget.oda.texto1;
                          });
                        },
                      ),
                      SizedBox(width: 3.0,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),

                        height: 50.0,
                        child: IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            Ouvir(context, 1);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      buttonAudio(
                        texto: 'Nível Intermediário',
                        ClickButton: () {
                          nivel = 2;
                          widget._audioPlayer.pause();

                          if (Settings.user != null) {
                            setState(() {
                              texto = widget.oda.texto2;
                            });
                          } else {
                            AvisoAlert(context,
                                "Faça o Login para ter acesso aos níveis Intermediário e Avançado");
                          }
                        },
                      ),
                      SizedBox(width: 3.0,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),

                        height: 50.0,
                        child: IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            Ouvir(context, 2);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      buttonAudio(
                        texto: 'Nível Avançado',
                        ClickButton: () {
                          nivel = 3;
                          widget._audioPlayer.pause();

                          if (Settings.user != null) {
                            setState(() {
                              texto = widget.oda.texto3;
                            });
                          } else {
                            AvisoAlert(context,
                                "Faça o Login para ter acesso aos níveis Intermediário e Avançado");
                          }
                        },
                      ),
                      SizedBox(width: 3.0,),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),

                        height: 50.0,
                        child: IconButton(
                          icon: Icon(Icons.volume_up),
                          onPressed: () {
                            Ouvir(context, 3);
                          },
                        ),
                      ),

                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Ouvir(BuildContext context, int nivel) async {
    nivel ??= 1;


    if(nivel > 1 && Settings.user == null){
      AvisoAlert(context, "Faça o Login para ter acesso aos níveis Intermediário e Avançado");

    }else{

      if (nivel == 1) {
          int result = await widget._audioPlayer
              .play(Settings.urlOda + widget.oda.audio1, isLocal: false);


          if(texto != widget.oda.texto1){
            setState(() {
              texto = widget.oda.texto1;
            });
          }

          if (result != 1) {
            AvisoAlert(context, "Não foi possível carregar o Áudio");
          }

        } else if (nivel == 2) {

            int result = await widget._audioPlayer.play(Settings.urlOda + widget.oda.audio2, isLocal: false);

            if(texto != widget.oda.texto2){
              setState(() {
                texto = widget.oda.texto2;
              });
            }

            if (result != 1) {
              AvisoAlert(context, "Não foi possível carregar o Áudio");
            }

        } else {

            int result = await widget._audioPlayer.play(Settings.urlOda + widget.oda.audio3, isLocal: false);

            if(texto != widget.oda.texto3){
              setState(() {
                texto = widget.oda.texto3;
              });
            }

            if (result != 1) {
              AvisoAlert(context, "Não foi possível carregar o Áudio");
            }

        }

    }


  }

  Future<Widget> AvisoAlert(BuildContext context, String texto) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return BeautifulAlertDialog(titulo: "Aviso", msg: texto);
        });
  }
}
