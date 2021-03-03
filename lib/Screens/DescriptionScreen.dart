import 'package:flutter/material.dart';
import '../Model/gm.dart' as model;

class DescriptionScreen extends StatefulWidget {
  static const routeNamed = '/DescriptionScreen';

  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    final foundedgame =
        ModalRoute.of(context).settings.arguments as model.GameModel;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: mqh / 2,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                foundedgame.image.screen_large_url,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
