import 'package:flutter/material.dart';


class email extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerEmail;
  TextEditingController _controllerNome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fale Conosco"),
        centerTitle: true,
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/fundo.jpg'),
            fit: BoxFit.none,
          ),
        ),

        child: ListView(
           padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
           children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _controllerNome,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "Nome",
                          hintText: "Informe o seu nome",
                          icon: Icon(
                            Icons.person,
                            color: Colors.black45,
                          )
                      ),

                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: _controllerEmail,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          labelText: "e-mail",
                          hintText: "Dígite o seu e-mail",
                          icon: Icon(
                            Icons.email,
                            color: Colors.black45,
                          )
                      ),

                    ),
                    const SizedBox(height: 30.0),

                  ],
                ),
              ),

           ],

        ),

      ),
    );
  }
}
