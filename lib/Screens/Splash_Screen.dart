import 'package:GiantBombAppFlutter/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../BLoC/GameBloc.dart';

class SplashScreen extends StatefulWidget {
  static const routeNamed = '/SplashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      gameBloc.getGames(30);
      Navigator.pushReplacementNamed(context, MainScreen.routeNamed);
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Lottie.asset(
          'lib/asset/stock.json',
          animate: true,
          alignment: Alignment.center,
          fit: BoxFit.cover,
          width: deviceSize.width - 160,
          height: deviceSize.height / 2,
        ),
      ),
    );
  }
}
