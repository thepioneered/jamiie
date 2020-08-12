import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class CreatePoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top:24.0),
          child: WebView(
            
        initialUrl: 'https://flutter.io',
        javascriptMode: JavascriptMode.unrestricted,
      )),
    );
  }
}
