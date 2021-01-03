import 'dart:async';

import '../../providers/addBank/bankprovider.dart';
import '../../server/endpoint.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';
import '../../widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class BankPage extends StatelessWidget {
  final String mobile;

  const BankPage({this.mobile});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BankProvider(),
      child: BankPageWidget(
        mobile: mobile,
      ),
    );
  }
}

class BankPageWidget extends StatelessWidget {
  final String mobile;

  const BankPageWidget({Key key, this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var bankProvider = Provider.of<BankProvider>(context);
    bankProvider.loadPage(mobile);
    return Scaffold(
        appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
        key: bankProvider.scaffoldKey,
        backgroundColor: AppColors.white,
        body: (bankProvider.isNetworkCallCompleted)
            ? (bankProvider.firstTimeAddBank
                ? AppWebView(mobile: mobile)
                : Center(
                    child: Text("Bank already attached.",
                        style: AppTextStyle.forgotPassword()),
                  ))
            : Center(child: CupertinoActivityIndicator()));
  }
}

class AppWebView extends StatefulWidget {
  final String mobile;

  const AppWebView({Key key, this.mobile}) : super(key: key);

  @override
  _AppWebViewState createState() => _AppWebViewState();
}

class _AppWebViewState extends State<AppWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: EndPoints.webviewLink(widget.mobile),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }
}
