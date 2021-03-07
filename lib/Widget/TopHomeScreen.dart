import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SearchWidget.dart';

class TopHomeScreen extends StatelessWidget {
  final Function handlerDrawer;
  final bool isOpen;
  TopHomeScreen(this.handlerDrawer, this.isOpen);

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    final mqh = MediaQuery.of(context).size.height;
    return SliverAppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      expandedHeight: mqh / 2,
      elevation: 50,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                children: [
                  !isOpen
                      ? Positioned(
                          top: 50,
                          left: 20,
                          child: IconButton(
                              iconSize: 42,
                              icon: Icon(
                                Icons.menu,
                                color: Theme.of(context).accentColor,
                              ),
                              onPressed: handlerDrawer),
                        )
                      : Positioned(
                          top: 15,
                          left: 10,
                          child: IconButton(
                            iconSize: 42,
                            color: Colors.white,
                            icon: Icon(
                              Icons.close,
                            ),
                            onPressed: handlerDrawer,
                          ),
                        ),
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
