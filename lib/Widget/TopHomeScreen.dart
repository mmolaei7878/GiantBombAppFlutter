import 'package:flutter/material.dart';
import 'SearchWidget.dart';

class TopHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqh = MediaQuery.of(context).size.height;
    return SliverAppBar(
      expandedHeight: mqh / 2,
      elevation: 50,
      backgroundColor: Color(0xff131418),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              child: Text(
                'Browse the Games',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontWeight: FontWeight.bold),
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
                        color: Color(0xff8764B8),
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
                    labelStyle: TextStyle(color: Colors.white),
                    labelText: 'search for games'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
