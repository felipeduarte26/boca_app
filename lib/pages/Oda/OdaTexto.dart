import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:boca_app/blocs/Oda.block.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:boca_app/pages/descricao/Descricao.dart';

class OdaTexto extends StatefulWidget {
  @override
  _OdaTextoState createState() => _OdaTextoState();
}

class _OdaTextoState extends State<OdaTexto> {
  bool _hasSpeech = false;
  TextEditingController Textfiltro = new TextEditingController();
  String Filtro = "";
  final TextStyle dropdownMenuItem = TextStyle(color: Colors.black, fontSize: 18);
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
        title: Text('Objeto'),
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpg'),
            fit: BoxFit.none,
          ),
        ),
        padding: EdgeInsets.all(20.0),

        child:Column(

          children: <Widget>[

            Container(
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  onChanged: (texto){
                    setState(() {
                      Filtro = Textfiltro.text.trim();
                    });

                  },
                  controller: Textfiltro,
                  cursorColor: Theme.of(context).primaryColor,
                  style: dropdownMenuItem,
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

            SizedBox(height: 10.0),

            Expanded(
               child:  ListView.builder(
                   itemCount: bloc.Oda.length,
                   itemBuilder: (BuildContext context, int index){
                     if(Textfiltro.text == null || Textfiltro.text.trim().isEmpty|| bloc.Oda[index].nome.trim().toUpperCase().contains(Filtro.trim().toUpperCase())){
                       return Card(
                         color: Colors.green.shade800,
                         elevation: 5.0,
                         child: SingleChildScrollView(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               ListTile(
                                 title: Text(bloc.Oda[index].nome, textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                                 trailing: Icon(
                                   Icons.keyboard_arrow_right,
                                   color: Colors.white,
                                 ),
                                 onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Descricao(img: bloc.Oda[index].imagem, nome: bloc.Oda[index].nome,))),


                               )
                             ],
                           ),

                         ),
                       ) ;
                     }else {
                       return SizedBox(
                         height: 0.0,
                         width: 0.0,
                       );
                     }
                   }
               ),

            ),
          ],
        ),

      ),
    );
  }


  void startListening() {
    speech.listen(onResult: resultListener);

  }

  void resultListener(SpeechRecognitionResult result) {
    Textfiltro.text = result.recognizedWords;

    setState(() {
      Filtro = Textfiltro.text;
    });

  }

  void errorListener(SpeechRecognitionError error ) {
    setState(() {

    });
  }
  void statusListener(String status ) {
    setState(() {

    });
  }
}
