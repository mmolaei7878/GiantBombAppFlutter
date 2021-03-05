import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';
import '../Widget/BottomHomeScreen.dart';
import '../Widget/TopHomeScreen.dart';
import 'package:provider/provider.dart';
import '../Provider/FavoriteProviderdart.dart';

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
    Provider.of<FavoritesProvider>(context, listen: false).getFavorites();
    gameBloc.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
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
