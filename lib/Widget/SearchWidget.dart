import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:GiantBombAppFlutter/Screens/DescriptionScreen.dart';
import 'package:flutter/material.dart';
import '../BLoC/SearchBloc.dart';
import 'package:lottie/lottie.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Container(
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(right: 10),
        child: IconButton(
          color: Color(0xff8764B8),
          onPressed: () {
            searchBloc.searchGames(query);
            showResults(context);
          },
          icon: Icon(Icons.search),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 10),
      child: IconButton(
        color: Color(0xff8764B8),
        onPressed: () {
          Navigator.of(context).pop();
          FocusScope.of(context).unfocus();
        },
        icon: Icon(Icons.navigate_before),
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder(
      stream: searchBloc.searchSubject,
      builder: (ctx, AsyncSnapshot<GameResponse> snapShot) {
        if (!snapShot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container(
            color: Theme.of(context).accentColor,
            child: ListView.builder(
              itemCount: snapShot.data.gameList.length,
              itemBuilder: (ctx, i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        DescriptionScreen.routeNamed,
                        arguments: snapShot.data.gameList[i]);
                  },
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        snapShot.data.gameList[i].image.screen_large_url,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )),
                  title: Text(
                    snapShot.data.gameList[i].name,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      searchBloc.searchGames(query);
      return StreamBuilder(
        stream: searchBloc.searchSubject,
        builder: (ctx, AsyncSnapshot<GameResponse> snapShot) {
          if (!snapShot.hasData) {
            return Center(
                child: Lottie.asset('lib/asset/cat.json',
                    reverse: true, animate: true, width: 300, height: 300));
          } else {
            return Container(
              color: Theme.of(context).accentColor,
              child: ListView.builder(
                itemCount: snapShot.data.gameList.length,
                itemBuilder: (ctx, i) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          DescriptionScreen.routeNamed,
                          arguments: snapShot.data.gameList[i]);
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        snapShot.data.gameList[i].image.screen_large_url,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      snapShot.data.gameList[i].name,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            );
          }
        },
      );
    } else {
      return Center(
        child: Lottie.asset('lib/asset/cat.json',
            alignment: Alignment.center,
            reverse: true,
            animate: true,
            width: 300,
            height: 300),
      );
    }
  }
}
