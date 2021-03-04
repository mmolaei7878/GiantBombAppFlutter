import 'package:GiantBombAppFlutter/BLoC/Authenthication.dart';
import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';
import '../Widget/BottomHomeScreen.dart';
import '../Widget/TopHomeScreen.dart';

class HomeScreen extends StatefulWidget {
  static const routeNamed = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    super.initState();

    gameBloc.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131418),
      body: CustomScrollView(
        slivers: [
          TopHomeScreen(),
          SliverList(
            delegate: SliverChildListDelegate(
              [BottomHomeScreen()],
            ),
          ),
        ],
      ),
    );
  }
}
