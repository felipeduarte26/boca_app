import 'package:boca_app/models/OdaModel.dart';
import 'package:flutter/material.dart';
import 'package:boca_app/blocs/Oda.block.dart';
import 'package:provider/provider.dart';
import 'package:boca_app/settings.dart';
import 'package:boca_app/pages/usuario/widgets/Dialogs.dart';
import 'package:boca_app/models/EmailModel.dart';
import 'package:boca_app/pages/login/widgets/LoginDialog.dart';

class Descricao extends StatefulWidget {
  @override
  _DescricaoState createState() => _DescricaoState();
}

class _DescricaoState extends State<Descricao> {

  String _value;
  String _url= '';
  TextEditingController _controllerTexto = new TextEditingController();
  final  email e_mail = email();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  Widget build(BuildContext context) {
    final OdaBlock bloc = Provider.of<OdaBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Objeto"),
        centerTitle: true,
      ),

      body: ListView(

        children: <Widget>[

          Center(


              child: DropdownButton<String>(

                items: bloc.Oda.map((OdaModel dropDownStringItem){
                  return DropdownMenuItem<String>(
                     value : dropDownStringItem.imagem,
                     child : Text(dropDownStringItem.nome),
                   );
                 }).toList(),
                 

                onChanged: (Valor){
                  setState(() {
                    _value = Valor;
                    _url = Settings.urlOda + Valor;
                  });
                },

                hint: Text('Selecione um Objeto', textAlign: TextAlign.center, style: TextStyle(fontSize: 16.0), ),
                value: _value,
              ),
            ),

          Container(
            color: Colors.grey.shade300,
            height: 250.0,
            width: double.infinity,
            child: Image.network(_url, fit: BoxFit.fill,),
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

                      if(_value != null && _value.trim().isEmpty == false){
                        Dialogs.showLoadingDialog(context, _keyLoader);//invoking login
                        try{

                          e_mail.Nome = Settings.user.nome;
                          e_mail.Email = Settings.user.email;
                          e_mail.Texto = _controllerTexto.text.trim();

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
                      }else{
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return BeautifulAlertDialog(
                                  titulo: "Aviso",
                                  msg: "Selecione um Objeto");
                            });
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

    );
  }
}
