import 'package:flutter/material.dart';

class MiddleDescriptionScreen extends StatelessWidget {
  final String description;
  final String deck;
  final String site;
  MiddleDescriptionScreen({this.deck, this.description, this.site});
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
                Container(
                  width: mqw,
                  height: 55,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: RaisedButton.icon(
                    color: Color(0xff8764B8),
                    icon: Icon(Icons.web_outlined),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    label: Text('Open WebSite'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
