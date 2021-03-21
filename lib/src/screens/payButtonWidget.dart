import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'adminPool/transactionPage.dart';

class PayButtonWithCheck extends StatelessWidget {
  final String poolId;
  final String poolName;

  const PayButtonWithCheck({Key key, this.poolId, this.poolName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PayButtonProvider(),
      child: PayButtonWidget(
        poolId: poolId,
        poolName: poolName,
      ),
    );
  }
}

class PayButtonWidget extends StatelessWidget {
  final String poolId;
  final String poolName;

  const PayButtonWidget({Key key, this.poolId, this.poolName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var payButtonProvider = Provider.of<PayButtonProvider>(context);
    return FutureBuilder(
      future: payButtonProvider.payButtonApiCall(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CupertinoActivityIndicator();
        } else if (snapshot.connectionState == ConnectionState.done &&
            payButtonProvider.payButton == true) {
          return AppButton.loginButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TransactionPage(
                      poolId: poolId,
                      poolName: poolName,
                    ),
                  ),
                );
              },
              title: "Pay");
        } else if (snapshot.connectionState == ConnectionState.done &&
            payButtonProvider.payButton == false) {
          return AppButton.loginButton(onTap: null, title: "Pay");
        } else {
          return Text("Error occured in pay button ");
        }
      },
    );
  }
}

class PayButtonProvider extends ChangeNotifier {
  bool payButton = false;

  Future<Null> payButtonApiCall() async {
    Map<String, dynamic> response = await NetworkCalls.getDataFromServer(
        key: null,
        endPoint: EndPoints.payButtonLogic,
        shouldPagePop: false,
        showSnackBar: false,
        authRequest: true);
    if (response["status"]) {
      if (response["body"]["payButton"]) {
        payButton = true;

        return null;
      }
    }
  }
}
