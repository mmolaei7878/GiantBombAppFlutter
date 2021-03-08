import 'BackgroundScreen.dart';
import 'HomeScreen.dart';
import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';

class MainScreen extends StatefulWidget {
  static const routeNamed = '/MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    gameBloc.getGames(30);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
