import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewShow extends StatelessWidget {
  static const routeNamed = '/WebView';
  @override
  Widget build(BuildContext context) {
    final adreess = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.black,
      body: WebView(
        initialUrl: adreess,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.navigate_before,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
