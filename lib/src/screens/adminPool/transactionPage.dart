import 'package:Jamiie/src/screens/Loan/loanScreen.dart';
import 'package:Jamiie/src/styles/text.dart';

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
    double height = MediaQuery.of(context).size.height - 75.0;
    var transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Payout to:',
                              style: AppTextStyle.subheadingText),
                          Text(
                            poolName,
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          Text('Payout amount:',
                              style: AppTextStyle.subheadingText),
                          Text(
                            transactionProvider.amount.poolAmount.toString(),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          SizedBox(height: 10.h)
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      child: AppButton.loginButton(
                        onTap: () {
                          transactionProvider.confirmPayment(poolId);
                        },
                        title: "Confirm Payment",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: height * 0.07,
                      child: AppButton.loginButton(
                        //todo change to push name

                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoanScreen(
                                poolAmount: transactionProvider.amount.poolAmount.toString(), 
                                poolId: poolId,
                              )));
                          // transactionProvider.takeLoan(poolId);
                        },
                        title: "Take a Loan",
                      ),
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
