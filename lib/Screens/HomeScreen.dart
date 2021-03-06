import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';
import '../Widget/BottomHomeScreen.dart';
import '../Widget/TopHomeScreen.dart';
import 'package:matrix4_transform/matrix4_transform.dart';

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
    super.initState();
    gameBloc.getGames(30);
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
              slivers: [
                TopHomeScreen(),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BottomHomeScreen(),
                    ],
                  ),
                ),
              ],
            ),
            !isOpen
                ? Positioned(
                    top: 50,
                    left: 20,
                    child: IconButton(
                        iconSize: 42,
                        icon: Icon(
                          Icons.menu,
                          color: Theme.of(context).accentColor,
                        ),
                        onPressed: () {
                          setState(() {
                            xoffSet = 230;
                            yoffSet = 150;
                            angle = -0.2;
                            isOpen = true;
                          });
                        }),
                  )
                : Positioned(
                    top: 15,
                    left: 10,
                    child: IconButton(
                      iconSize: 42,
                      color: Colors.white,
                      icon: Icon(
                        Icons.close,
                        color: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        if (isOpen == true) {
                          setState(
                            () {
                              xoffSet = 0;
                              yoffSet = 0;
                              angle = 0;
                              isOpen = false;
                            },
                          );
                        }
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
