import 'package:GiantBombAppFlutter/Screens/DescriptionScreen.dart';
import 'package:flutter/material.dart';
import '../BLoC/GameBloc.dart';
import '../Repository/GameResponse.dart';

class BottomHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Container(
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
                builder: (ctx, AsyncSnapshot<GameResponse> snapShot) {
                  if (!snapShot.hasData) {
                    return Container(
                      alignment: Alignment.topCenter,
                      margin: EdgeInsets.only(top: 20),
                      width: mqw,
                      height: 70,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: GridView.builder(
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
                                  child: Image.network(
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
        ],
      ),
    );
  }
}
