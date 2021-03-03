import 'package:flutter/material.dart';

class MiddleDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Container(
            width: mqw,
            height: mqh / 2 + 100,
            color: Color(0xff131418),
            child: Column(
              children: [Container()],
            ),
          ),
        ],
      ),
    );
  }
}
