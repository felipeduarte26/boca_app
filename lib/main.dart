import 'package:provider/provider.dart';
import 'blocs/Oda.block.dart';
import 'package:flutter/material.dart';
import 'blocs/user.block.dart';
import 'package:boca_app/pages/splash/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<OdaBlock>.value(value: OdaBlock()),
          ChangeNotifierProvider<UserBloc>.value(value: UserBloc()),

        ],
        child: MaterialApp(
          title: 'Boca - App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.green.shade800,
            //primarySwatch:  Colors.red,
          ),
          home: Splash(),//  HomePage(),
        ),
    );
  }
}

