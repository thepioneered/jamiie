import 'dart:async';

import 'package:Jamiie/src/providers/addBank/bankprovider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
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
      child: BankPageWidget(),
    );
  }
}

class BankPageWidget extends StatefulWidget {
  @override
  _BankPageWidgetState createState() => _BankPageWidgetState();
}

class _BankPageWidgetState extends State<BankPageWidget> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var bankProvider = Provider.of<BankProvider>(context);
    return Scaffold(
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      key: bankProvider.scaffoldKey,
      backgroundColor: AppColors.white,
      body: FutureBuilder<Null>(
        future: bankProvider.loadPage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.error == 405 &&
              snapshot.connectionState == ConnectionState.done) {
            return Center(
              //TODO: Style pending haii
              child: Text("Bank already attached.",style: AppTextStyle.forgotPassword()),
            );
          } else if (!snapshot.hasError &&
              snapshot.connectionState == ConnectionState.done) {
            return WebView(
                initialUrl: bankProvider.url,
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _controller.complete(webViewController);
                },
              
            );
          } else {
            return Center(child: Text("Error occured! Please Check."));
          }
        },
      ),
    );
  }
}
