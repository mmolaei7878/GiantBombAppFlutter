import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/FavoriteProviderdart.dart';

class MiddleDescriptionScreen extends StatefulWidget {
  final String description;
  final String deck;
  final String site;
  final int id;

  MiddleDescriptionScreen(
      {this.deck, this.description, this.site, @required this.id});

  @override
  _MiddleDescriptionScreenState createState() =>
      _MiddleDescriptionScreenState();
}

class _MiddleDescriptionScreenState extends State<MiddleDescriptionScreen> {
  var isFavorite = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var isInit = true;
    if (isInit) {
      final prove =
          Provider.of<FavoritesProvider>(context, listen: false).favorites;
      final singleItem = Provider.of<FavoritesProvider>(context)
          .singleFavoriteStatus(widget.id.toString());
      if (prove.contains(widget.id.toString())) {
        isFavorite = true;
      } else {
        isFavorite = false;
      }
    }
    isInit = false;
  }

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
                    widget.deck,
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
                        onPressed: () {},
                        label: Text('Open WebSite'),
                      ),
                    ),
                    Consumer<FavoritesProvider>(
                      builder: (ctx, provider, ch) {
                        return Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isFavorite ? Colors.red : Colors.white),
                          width: 55,
                          height: 55,
                          child: IconButton(
                            color: Color(0xff8764B8),
                            iconSize: 32,
                            icon: Icon(Icons.favorite),
                            onPressed: isFavorite
                                ? () {
                                    setState(() {
                                      isFavorite = false;
                                    });
                                    provider.deleteFromFavorites(
                                        widget.id.toString());
                                  }
                                : () {
                                    setState(() {
                                      isFavorite = true;
                                    });
                                    provider
                                        .addToFavorites(widget.id.toString());
                                  },
                          ),
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
