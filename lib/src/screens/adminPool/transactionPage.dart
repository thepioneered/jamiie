import '../../providers/transaction/transactionProvider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';
import '../../widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({this.poolId, this.poolName});
  final String poolName;
  final String poolId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: TransactionPageWidget(poolId: poolId, poolName: poolName),
    );
  }
}

class TransactionPageWidget extends StatelessWidget {
  TransactionPageWidget({this.poolId, this.poolName});
  final String poolName;
  final String poolId;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      key: transactionProvider.transactionPageScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: FutureBuilder<Null>(
        future: transactionProvider.loadPageData(poolId),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasError) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 1.wp,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Payout to:',
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            poolName,
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          // Text(
                          //   "Payment Amount : ${transactionProvider.amount.amount.toString()}",
                          // )
                        ],
                      ),
                    ),
                    AppButton.loginButton(
                      onTap: () {},
                      title: "Confirm Payment",
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text("Error Occured"),
            );
          }
        },
      ),
    );
  }
}
