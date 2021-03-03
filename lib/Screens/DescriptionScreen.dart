import 'package:flutter/material.dart';
import '../Model/gm.dart' as model;
import '../Widget/DescriptionScreenTopWidget.dart';
import '../BLoC/GameBloc.dart';
import '../Model/ScreenResponse.dart';
import '../Widget/MiddleDescriptionScreen.dart';

class DescriptionScreen extends StatefulWidget {
  static const routeNamed = '/DescriptionScreen';

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  model.GameModel foundedgame;
  var isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      foundedgame =
          ModalRoute.of(context).settings.arguments as model.GameModel;
      gameBloc.getScreenShots(foundedgame.guid);
    }
    isInit = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff131418),
      body: StreamBuilder(
        stream: gameBloc.subjectScreenShot,
        builder: (ctx, AsyncSnapshot<ScreenResponse> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return (CustomScrollView(
              slivers: [
                DescriptionScreenTopWidget(
                  name: foundedgame.name,
                  date_last_updated: foundedgame.date_last_updated,
                  image: foundedgame.image.screen_large_url,
                  number_of_user_reviews:
                      foundedgame.number_of_user_reviews.toString(),
                ),
                MiddleDescriptionScreen(),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return Image.network(
                          snapShot.data.screenShots[i].screen_url);
                    },
                    childCount: snapShot.data.screenShots.length,
                  ),
                ),
              ],
            ));
          }
        },
      ),
    );
  }
}
