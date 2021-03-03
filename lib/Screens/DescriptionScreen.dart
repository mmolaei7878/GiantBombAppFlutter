import 'package:flutter/material.dart';
import '../Model/gm.dart' as model;
import '../Widget/DescriptionScreenTopWidget.dart';

class DescriptionScreen extends StatefulWidget {
  static const routeNamed = '/DescriptionScreen';

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    final foundedgame =
        ModalRoute.of(context).settings.arguments as model.GameModel;
    return Scaffold(
      backgroundColor: Color(0xff131418),
      body: CustomScrollView(
        slivers: [
          DescriptionScreenTopWidget(
            name: foundedgame.name,
            date_last_updated: foundedgame.date_last_updated,
            image: foundedgame.image.screen_large_url,
            number_of_user_reviews:
                foundedgame.number_of_user_reviews.toString(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Image.network(
                  'https://www.talkwalker.com/images/2020/blog-headers/image-analysis.png'),
              childCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
