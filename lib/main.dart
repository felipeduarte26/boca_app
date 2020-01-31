import 'package:flutter/material.dart';
import 'pages/login/login.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boca - App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green.shade800,
        //primarySwatch:  Colors.red,
      ),
      home: login(),
    );
  }
}




