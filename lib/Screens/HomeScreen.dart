import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';
import '../Widget/BottomHomeScreen.dart';
import '../Widget/TopHomeScreen.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import '../Injecter.dart';

class HomeScreen extends StatefulWidget {
  static const routeNamed = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isPlaying = false;
  bool isOpen = false;
  @override
  void initState() {
    super.initState();
    locator.get<GameBloc>().getGames(30);
  }

  changeDrawerPosition() {
    if (!isOpen) {
      setState(() {
        xoffSet = 230;
        yoffSet = 150;
        angle = -0.2;
        isOpen = true;
      });
    } else {
      setState(
        () {
          xoffSet = 0;
          yoffSet = 0;
          angle = 0;
          isOpen = false;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      transform: Matrix4Transform()
          .translate(x: xoffSet, y: yoffSet)
          .rotate(angle)
          .matrix4,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Stack(
          children: [
            CustomScrollView(
              physics: isOpen
                  ? NeverScrollableScrollPhysics()
                  : AlwaysScrollableScrollPhysics(),
              slivers: [
                TopHomeScreen(changeDrawerPosition, isOpen),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BottomHomeScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
