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
    super.initState();
    gameBloc.getGames();
  }

  bool dashagh = false;
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff131418),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: mqh / 2,
            elevation: 50,
            backgroundColor: Color(0xff131418),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  SizedBox(
                    height: 150,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      'Browse the Games',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 32),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff8764B8),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          suffixIcon: Container(
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff8764B8),
                            ),
                            child: Icon(
                              Icons.navigate_next_sharp,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          border: InputBorder.none,
                          icon: Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                          contentPadding: EdgeInsets.only(left: 5),
                          labelStyle: TextStyle(color: Colors.white),
                          labelText: 'search for games'),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  width: mqw,
                  height: mqh,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 0,
                        width: mqw,
                        height: mqh,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: Color(0xff8764B8),
                          ),
                          child: StreamBuilder(
                            stream: gameBloc.subject,
                            builder:
                                (ctx, AsyncSnapshot<GameResponse> snapShot) {
                              if (!snapShot.hasData) {
                                return Container(
                                  alignment: Alignment.topCenter,
                                  margin: EdgeInsets.only(top: 20),
                                  width: mqw,
                                  height: 70,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.black,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  ),
                                );
                              } else {
                                return DraggableScrollableSheet(
                                  expand: true,
                                  initialChildSize: 0.9,
                                  minChildSize: 0.6,
                                  builder: (context, scrollController) =>
                                      ListView.separated(
                                    controller: scrollController,
                                    separatorBuilder: (ctx, index) => SizedBox(
                                      width: 10,
                                      height: 10,
                                    ),
                                    itemCount: snapShot.data.gameList.length,
                                    itemBuilder: (ctx, index) => ListTile(
                                      title: Text(
                                          snapShot.data.gameList[index].name),
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
