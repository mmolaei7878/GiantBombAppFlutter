import 'package:GiantBombAppFlutter/Screens/WebViewShow.dart';
import 'package:flutter/material.dart';
import '../BLoC/FavoriteBloc.dart';

class MiddleDescriptionScreen extends StatelessWidget {
  final String description;
  final String deck;
  final String site;
  final int id;
  MiddleDescriptionScreen(
      {this.deck, this.description, this.site, @required this.id});

  var isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            color: Theme.of(context).primaryColor,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    deck,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: mqw / 2,
                      height: 55,
                      margin: EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      child: RaisedButton.icon(
                        color: Color(0xff8764B8),
                        icon: Icon(Icons.web_outlined),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              WebViewShow.routeNamed,
                              arguments: site);
                        },
                        label: Text('Open WebSite'),
                      ),
                    ),
                    StreamBuilder(
                      stream: favoriteBloc.streamFav,
                      builder: (ctx, AsyncSnapshot<String> snapShot) {
                        if (snapShot.data.toString() == id.toString()) {
                          isFavorite = true;
                        }
                        return Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          width: 55,
                          height: 55,
                          child: IconButton(
                              iconSize: 32,
                              color:
                                  isFavorite ? Colors.red : Color(0xff8764B8),
                              icon: Icon(isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border),
                              onPressed: isFavorite
                                  ? () async {
                                      isFavorite = false;
                                      await favoriteBloc.deleteFromFavorites(
                                        id.toString(),
                                      );
                                    }
                                  : () async {
                                      isFavorite = true;
                                      await favoriteBloc.addToFavorite(
                                        id.toString(),
                                      );
                                    }),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
