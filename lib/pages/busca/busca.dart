import 'package:boca_app/blocs/Oda.block.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/pages/busca/widegts/SelecionaOda.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

class BuscaItens extends StatefulWidget {

  BuscaItens({Key key}) : super(key: key);


  _BuscaItens createState() => _BuscaItens();
}

class _BuscaItens extends State<BuscaItens> {

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
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fundo.jpg'),
              fit: BoxFit.none,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 130),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SelecionaOda(oda: bloc.Oda, filtrar: Filtro.text.trim().toUpperCase(),),
              ),
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
                        "Objeto Digital em Audidescrição",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[

                    SizedBox(
                      height: 70,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          onChanged: FiltraTexto,
                          controller: Filtro,
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Procurar ODA",
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
                  ],
                ),
              ),

            ],
          ),
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
