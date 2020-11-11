import 'package:Jamiie/src/providers/addBank/bankprovider.dart';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class BankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BankProvider(),
      child: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var bankProvider = Provider.of<BankProvider>(context);
    return Scaffold(
      key: bankProvider.scaffoldKey,
      body: FutureBuilder<Null>(
          future: bankProvider.loadPage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (!snapshot.hasError) {
              return SafeArea(
                // padding: EdgeInsets.only(top:20),
                child: WebView(
                  initialUrl: bankProvider.url,
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              );
            }
            else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          }),
    );
  }
}
