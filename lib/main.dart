import 'package:GiantBombAppFlutter/Screens/DescriptionScreen.dart';
import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/AuthScreen.dart';
import 'BLoC/Authenthication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white, fontSize: 18),
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: authentication.tokenStream,
        builder: (ctx, AsyncSnapshot<String> snapShot) {
          if (snapShot.data == null) {
            return AuthScreen();
          } else if (snapShot.data.length > 5) {
            return HomeScreen();
          } else {
            authentication.tryAutoLogin();

            return AuthScreen();
          }
        },
      ),
      routes: {
        DescriptionScreen.routeNamed: (ctx) => DescriptionScreen(),
        AuthScreen.routeNamed: (ctx) => AuthScreen(),
        HomeScreen.routeNamed: (ctx) => HomeScreen()
      },
    );
  }
}
