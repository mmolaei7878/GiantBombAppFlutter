import 'package:GiantBombAppFlutter/Repository/GameResponse.dart';
import 'package:GiantBombAppFlutter/Screens/DescriptionScreen.dart';
import 'package:flutter/material.dart';
import '../BLoC/SearchBloc.dart';

class SearchWidget extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 10),
        child: FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            FocusScope.of(context).unfocus();
          },
          child: Text('Close'),
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return Container();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
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
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
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
                  title: Text(snapShot.data.gameList[i].name),
                ),
              ),
            );
          }
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
