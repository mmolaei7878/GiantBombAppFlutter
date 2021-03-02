import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';

class HomeScreen extends StatefulWidget {
  static const routeNamed = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    gameBloc.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: gameBloc.subject,
        builder: (ctx, AsyncSnapshot<GameResponse> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: snapShot.data.gameList
                    .map(
                      (e) => ListTile(
                        leading: Image.network(
                          e.image.screen_large_url,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        title: Text(e.name),
                      ),
                    )
                    .toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
