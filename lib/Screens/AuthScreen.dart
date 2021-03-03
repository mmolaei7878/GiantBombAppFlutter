import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  static const routeNamed = '/AuthScreen';
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final mqw = MediaQuery.of(context).size.width;
    final mqh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Image.asset(
        'lib/asset/3.jpg',
        fit: BoxFit.cover,
        width: mqw,
        height: mqh,
      ),
    );
  }
}
