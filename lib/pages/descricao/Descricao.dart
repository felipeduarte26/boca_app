import 'package:boca_app/models/OdaModel.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/blocs/Oda.block.dart';
import 'package:provider/provider.dart';
import 'package:boca_app/settings.dart';
import 'package:boca_app/pages/usuario/widgets/Dialogs.dart';
import 'package:boca_app/models/EmailModel.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';

import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

class Descricao extends StatefulWidget {
  @override
  _DescricaoState createState() => _DescricaoState();

  final String img;
  final String nome;

  Descricao({this.img, this.nome});
}

class _DescricaoState extends State<Descricao> {
  bool _hasSpeech = false;

  TextEditingController _controllerTexto = new TextEditingController();
  final  email e_mail = email();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  final SpeechToText speech = SpeechToText();

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(onError: errorListener, onStatus: statusListener );

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  void initState(){
    super.initState();
    initSpeechState();
  }

  @override
  Widget build(BuildContext context) {
    final OdaBlock bloc = Provider.of<OdaBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(20.0),
        child:ListView(

          children: <Widget>[

            SizedBox(height: 5.0,),
            Container(
              color: Colors.grey.shade300,
              height: 250.0,
              width: double.infinity,
              child: Image.network(Settings.urlOda+widget.img, fit: BoxFit.fill,),
            ),
            const SizedBox(height: 13.0),
            Text("Escreva sobre o Objeto", textAlign: TextAlign.center,),

            Container(
              color: Colors.white,
              child: TextField(
                controller: _controllerTexto,
                textInputAction: TextInputAction.done,
                textAlign: TextAlign.start,
                minLines: 5,
                maxLength: 300,
                decoration: new InputDecoration(
                  contentPadding: EdgeInsets.all(30.0),
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                ),
                autocorrect: true,
                style: TextStyle(height: 2.0),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),

            const SizedBox(height: 30.0),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                color: Colors.green,
                onPressed:() async{

                  if(Settings.user != null){

                    if(_controllerTexto.text.trim().isEmpty == false){
                        Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
                        try{

                          e_mail.Nome = Settings.user.nome;
                          e_mail.Email = Settings.user.email;
                          e_mail.Texto = widget.nome+': '+_controllerTexto.text.trim();

                          if(await e_mail.enviar()){
                            _controllerTexto.text = "";
                            Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BeautifulAlertDialog(
                                      titulo: "Aviso",
                                      msg: "E-mail Enviado com Sucesso");
                                });
                          }else{
                            Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BeautifulAlertDialog(
                                      titulo: "Aviso",
                                      msg: "Ocorreu um erro ao tentar enviar o E-mail");
                                });
                          }

                        }catch(e){
                          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
                        }
                    }
                  }else{
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return BeautifulAlertDialog(
                              titulo: "Aviso",
                              msg: "Você Precisa estar Logado para Realizar essa Operação");
                        });
                  }

                },

                child: Text( 'Enviar', style: TextStyle(color: Colors.white), ),
              ),
            ),

          ],
        ),
      )

    );
  }

  void startListening() {
    speech.listen(onResult: resultListener);

  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      _controllerTexto.text = result.recognizedWords;
    });

  }

  void errorListener(SpeechRecognitionError error ) {
    setState(() {
     // lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }
  void statusListener(String status ) {
    setState(() {
    //  lastStatus = "$status";
    });
  }
}
