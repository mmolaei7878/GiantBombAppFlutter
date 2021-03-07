import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../BLoC/Authenthication.dart';
import '../BLoC/ThemeBloc.dart';
import 'package:lottie/lottie.dart';

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 550,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: ListTile(
                    title: Text(
                      'Log Out',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    leading: IconButton(
                        color: Colors.white,
                        iconSize: 37,
                        icon: Icon(Icons.logout),
                        onPressed: () {
                          authentication.logOut();
                        }),
                  ),
                ),
                StreamBuilder(
                    initialData: themeBloc.defaultValue,
                    stream: themeBloc.colorStream,
                    builder: (ctx, snapShot) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 18),
                        child: ListTile(
                          title: Text(
                            'Dark Mode',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          leading: CupertinoSwitch(
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
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
