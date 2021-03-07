import 'package:GiantBombAppFlutter/Screens/DescriptionScreen.dart';
import 'package:GiantBombAppFlutter/Screens/WebViewShow.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/AuthScreen.dart';
import 'BLoC/Authenthication.dart';
import 'BLoC/ThemeBloc.dart' as theme;
import 'Screens/MainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: theme.themeBloc.defaultValue,
        stream: theme.themeBloc.colorStream,
        builder: (ctx, AsyncSnapshot<theme.ModeTheme> snapShot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: snapShot.data.index == 0
                ? ThemeData(
                    errorColor: Colors.black,
                    primaryColor: Color(0xff121212),
                    accentColor: Color(0xff1F1C24),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(color: Colors.white60, fontSize: 18),
                    ),
                  )
                : ThemeData(
                    errorColor: Colors.black,
                    primaryColor: Color(0xff000000),
                    accentColor: Color(0xff8764B8),
                    textTheme: TextTheme(
                      bodyText1: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
            home: StreamBuilder(
              stream: authentication.tokenStream,
              builder: (ctx, AsyncSnapshot<String> snapShot) {
                if (snapShot.data == null) {
                  authentication.tryAutoLogin();
                  return AuthScreen();
                } else if (snapShot.data.length > 15) {
                  return MainScreen();
                } else {
                  authentication.tryAutoLogin();
                  return AuthScreen();
                }
              },
            ),
            routes: {
              DescriptionScreen.routeNamed: (ctx) => DescriptionScreen(),
              AuthScreen.routeNamed: (ctx) => AuthScreen(),
              HomeScreen.routeNamed: (ctx) => HomeScreen(),
              WebViewShow.routeNamed: (ctx) => WebViewShow(),
              MainScreen.routeNamed: (ctx) => MainScreen(),
            },
          );
        });
  }
}
