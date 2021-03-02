import 'package:flutter/material.dart';
import '../Repository/Repository.dart';

class HomeScreen extends StatefulWidget {
  static const routeNamed = '/HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    repository.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
