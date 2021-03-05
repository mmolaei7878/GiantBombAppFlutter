import 'package:GiantBombAppFlutter/Provider/FavoriteProviderdart.dart';
import 'package:flutter/material.dart';
import '../Model/gm.dart' as model;
import '../Widget/DescriptionScreenTopWidget.dart';
import '../BLoC/GameBloc.dart';
import '../Model/ScreenResponse.dart';
import 'package:provider/provider.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder(
        stream: gameBloc.subjectScreenShot,
        builder: (ctx, AsyncSnapshot<ScreenResponse> snapShot) {
          if (!snapShot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
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
                MiddleDescriptionScreen(
                  id: foundedgame.id,
                  deck: foundedgame.deck,
                  description: foundedgame.description,
                  site: foundedgame.site_detail_url,
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: () {},
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                snapShot.data.screenShots[i].screen_url),
                          ),
                        ),
                      );
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
