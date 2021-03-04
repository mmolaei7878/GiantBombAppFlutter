import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SearchWidget.dart';
import '../BLoC/Authenthication.dart';
import '../BLoC/ThemeBloc.dart';

class TopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: mqh / 2,
      elevation: 50,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    child: IconButton(
                        color: Theme.of(context).accentColor,
                        iconSize: 37,
                        icon: Icon(Icons.logout),
                        onPressed: () {
                          authentication.logOut();
                        }),
                  ),
                  StreamBuilder(
                      initialData: themeBloc.defaultValue,
                      stream: themeBloc.colorStream,
                      builder: (ctx, snapShot) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 18),
                          child: CupertinoSwitch(
                            activeColor: Color(0xff332940),
                            trackColor: Colors.white38,
                            value: snapShot.data.index == 0 ? true : false,
                            onChanged: (value) {
                              if (!value) {
                                themeBloc.setColor(0);
                              } else {
                                themeBloc.setColor(1);
                              }
                            },
                          ),
                        );
                      })
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'Browse the Games',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 55),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xff8764B8),
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: SearchWidget(),
                  );
                },
                decoration: InputDecoration(
                    suffixIcon: Container(
                      margin: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).accentColor,
                      ),
                      child: Icon(
                        Icons.navigate_next_sharp,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    border: InputBorder.none,
                    icon: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(left: 5),
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 15),
                    labelText: 'search for games'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
