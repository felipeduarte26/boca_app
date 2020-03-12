import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:boca_app/blocs/Oda.block.dart';
import 'package:flutter/material.dart';

class Listar extends StatefulWidget {
  @override
  _ListarState createState() => _ListarState();
}

class _ListarState extends State<Listar> {

  final TextStyle dropdownMenuItem = TextStyle(color: Colors.black, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    final OdaBlock bloc = Provider.of<OdaBlock>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Listar"),
        centerTitle: true,

      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpg'),
            fit: BoxFit.none,
          ),
        ),
        padding: EdgeInsets.all(10.0),

        child:Column(


          children: <Widget>[

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextField(
                  //onChanged: FiltraTexto,
                  //controller: Filtro,
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
                          //onTap: startListening,
                          child: Icon(Icons.keyboard_voice),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15)),
                ),
              ),
            ),

            SizedBox( height: 10.0),


            Expanded(
                child: ListView.builder(
                    itemCount:  bloc.Oda.length,
                    itemBuilder: (context, index){

                      return Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Card(
                          color: Colors.green.shade800,
                          elevation: 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              ListTile(
                                  title: Text(
                                    bloc.Oda[index].nome,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Colors.white,
                                  ),
                                  onTap: () {}
                              ),

                            ],
                          ),
                        ),
                      );
                    }
                ),
            ),


          ],
        )
      )
    );
  }
}
