import 'package:flutter/material.dart';
import 'package:boca_app/pages/busca/widegts/Listar.dart';

class BuscaItens extends StatefulWidget {
  BuscaItens({Key key}) : super(key: key);
  static final String path = "lib/src/pages/lists/list2.dart";

  _BuscaItens createState() => _BuscaItens();
}

class _BuscaItens extends State<BuscaItens> {
  final TextStyle dropdownMenuItem =
      TextStyle(color: Colors.black, fontSize: 18);

  final List<Map> ItensList = [
    {
      "nome": "ARCO-IRIS",
      "img":
          "https://bocaweb.s3.amazonaws.com/imagem-ARCO-IRIS.jpg?AWSAccessKeyId=AKIAIT73QSIVYDWUFJPA&Expires=1580705553&Signature=6SJw4VkvZXNBePEGsZQeuzGpwzs%3D"
    },
    {
      "nome": "MENINO GATO- DESENHO ANIMADO",
      "img":
          "https://bocaweb.s3.amazonaws.com/imagem-MENINO%20GATO-%20DESENHO%20ANIMADO.jpg?AWSAccessKeyId=AKIAIT73QSIVYDWUFJPA&Expires=1580705652&Signature=xWTCySQsCfG7I1rIugG5vK%2FUiHs%3D"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(top: 160),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: ItensList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListarItens(context: context, index: index, Item: ItensList);
                      }
                    ),
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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          style: dropdownMenuItem,
                          decoration: InputDecoration(
                              hintText: "Procurar ODA",
                              hintStyle: TextStyle(
                                  color: Colors.black38, fontSize: 16),
                              prefixIcon: Material(
                                elevation: 0.0,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: Icon(Icons.search),
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
}
