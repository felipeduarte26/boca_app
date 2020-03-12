import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:boca_app/blocs/Oda.block.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:boca_app/pages/busca/widegts/SelecionaBuscaOda.dart';
import 'package:boca_app/models/OdaModel.dart';
import 'package:boca_app/pages/Oda/Oda.dart';


class BuscaOda extends StatefulWidget {
  @override
  _BuscaOdaState createState() => _BuscaOdaState();
}

class _BuscaOdaState extends State<BuscaOda> {

  bool _hasSpeech = false;
  final TextEditingController Filtro = new TextEditingController();
  final TextStyle dropdownMenuItem = TextStyle(color: Colors.black, fontSize: 18);
  final SpeechToText speech = SpeechToText();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String FilterText = "";


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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpg'),
            fit: BoxFit.none,
          ),
        ),
        child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green.shade800,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Objeto Digital em Audiodescrição",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: TextField(
                    controller: Filtro,
                    onChanged: FiltraTexto,
                    cursorColor: Theme.of(context).primaryColor,

                    decoration: InputDecoration(
                        hintText: "Procurar Objeto",
                        hintStyle: TextStyle(color: Colors.black38, fontSize: 16),
                        prefixIcon: Material(
                          elevation: 0.0,
                          borderRadius:
                          BorderRadius.all(Radius.circular(30)),
                          child: InkWell(
                            onTap: startListening,
                            child: Icon(Icons.keyboard_voice),
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 25, vertical: 15)),
                  ),
                ),
              ),


              SelecionaBuscaOda(filtrar: FilterText, oda: bloc.Oda,),

            ],
        ),
      ),
    );
  }

  void FiltraTexto(String texto){

    setState(() {
      if(texto!= null || texto.trim().isEmpty == false){
        FilterText =  Filtro.text.trim().toUpperCase();
      }else FilterText = null;
    });


  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(onResult: resultListener);

  }

  void resultListener(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;

    setState(() {
      FilterText = lastWords;
      Filtro.text = FilterText;
    });

  }

  void errorListener(SpeechRecognitionError error ) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }
  void statusListener(String status ) {
    setState(() {
      lastStatus = "$status";
    });
  }
}
