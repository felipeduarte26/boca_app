import 'package:flutter/material.dart';
import 'package:boca_app/pages/login/login.dart';

class ConfirmDialog extends StatelessWidget {
  final String titulo;
  final String msg;


  ConfirmDialog({@required this.titulo, @required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.only(right: 16.0),
          height: 400,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  bottomLeft: Radius.circular(75),
                  topRight: Radius.circular(75),
                  bottomRight: Radius.circular(75))),
          child: Row(
            children: <Widget>[


              SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      titulo,
                      style: Theme.of(context).textTheme.title,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40.0),
                    Flexible(
                      child: Text(msg),
                    ),
                    SizedBox(height: 50.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            child: Text("OK"),
                            color: Colors.green,
                            colorBrightness: Brightness.dark,
                            onPressed: ()=> Navigator.pop(context),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        ),
                      ],
                    ),
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
