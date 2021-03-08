import 'package:GiantBombAppFlutter/Screens/DescriptionScreen.dart';
import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';
import '../Repository/GameResponse.dart';
import '../Injecter.dart';

class BottomHomeScreen extends StatefulWidget {
  @override
  _BottomHomeScreenState createState() => _BottomHomeScreenState();
}

class _BottomHomeScreenState extends State<BottomHomeScreen> {
  final scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(
      () async {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          setState(() {
            hasMore = true;
          });
          await locator.get<GameBloc>().getmore(100);
          setState(() {
            hasMore = false;
          });
        }
      },
    );
    super.initState();
  }

  var hasMore = false;
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).accentColor,
              ),
              child: StreamBuilder(
                stream: locator.get<GameBloc>().subject,
                builder: (ctx, AsyncSnapshot<GameResponse> snapShot) {
                  if (!snapShot.hasData) {
                    return Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 20),
                      width: mqw,
                      height: 70,
                      child: CircularProgressIndicator(
                        backgroundColor: Color(0xff212121),
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.all(15.0),
                      child: GridView.builder(
                        controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3.3 / 2.3,
                          crossAxisCount: 3,
                        ),
                        itemCount: snapShot.data.gameList.length,
                        itemBuilder: (ctx, index) => Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      DescriptionScreen.routeNamed,
                                      arguments: snapShot.data.gameList[index],
                                    );
                                  },
                                  child: locator.get<GameBloc>().loading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Image.network(
                                          snapShot.data.gameList[index].image
                                              .screen_large_url,
                                          height: 180,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                snapShot.data.gameList[index].name,
                                style: TextStyle(color: Colors.white),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
          if (hasMore)
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 20),
              width: mqw,
              height: 70,
              child: CircularProgressIndicator(
                backgroundColor: Color(0xff212121),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
        ],
      ),
    );
  }
}
