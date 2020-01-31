import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/login.dart';

class QuestionDialog extends StatelessWidget {
  final String titulo;
  final String msg;
  final Function YesOptions;
  final Function NoOptions;


  QuestionDialog({this.titulo, this.msg, this.YesOptions, this.NoOptions});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 150,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              )
          ),
          child: Row(
            children: <Widget>[
              SizedBox(width: 20.0),
              CircleAvatar(radius: 55, backgroundColor: Colors.grey.shade200, child: Image.asset('images/logo.png', width: 60,),),
              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(titulo, style: Theme.of(context).textTheme.title,),
                    SizedBox(height: 10.0),
                    Flexible(
                      child: Text(msg),
                    ),
                    SizedBox(height: 10.0),
                    Row(children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          child: Text("não"),
                          color: Colors.red,
                          colorBrightness: Brightness.dark,
                          onPressed: NoOptions,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Expanded(
                        child: RaisedButton(
                          child: Text("sim"),
                          color: Colors.green,
                          colorBrightness: Brightness.dark,
                          onPressed: YesOptions,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),

                    ],),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}