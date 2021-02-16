import 'package:Jamiie/src/providers/Loan/loanListProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RepayLoanPage extends StatelessWidget {
  final String poolId;
  final int amount;
  final String transactionId;

  RepayLoanPage({this.amount, this.poolId, this.transactionId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoanListProvider(),
      child: RepayLoanPageWidget(
        amount: amount,
        poolId: poolId,
        transactionId: transactionId,
      ),
    );
  }
}

class RepayLoanPageWidget extends StatelessWidget {
  final String poolId;
  final int amount;
  final String transactionId;

  RepayLoanPageWidget({this.amount, this.poolId, this.transactionId});
  @override
  Widget build(BuildContext context) {
    return Consumer<LoanListProvider>(
        builder: (_, loanListScreenProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
        key: loanListScreenProvider.scaffoldKey,
        body: FutureBuilder<Null>(
            future: loanListScreenProvider.loadPageData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (!snapshot.hasError &&
                  snapshot.connectionState == ConnectionState.done) {
                return Container(
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
                            Text('Pool Id:',
                                style: AppTextStyle.subheadingText),
                            Text(
                              poolId,
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Amount:', style: AppTextStyle.subheadingText),
                            Text(
                             '\$' + amount.toString(),
                              style: TextStyle(
                                fontFamily: 'poppins',
                                fontSize: 26.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.07.hp,
                        child: AppButton.loginButton(
                          onTap: () {
                            loanListScreenProvider.repayLoan(transactionId);
                          },
                          title: "Conifrm Payment",
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                try {
                  return Center(
                    child: Text(snapshot.error),
                  );
                } catch (e) {
                  return Center(
                    child: Text(
                      "Error occured",
                    ),
                  );
                }
              }
            }),
      );
    });
  }
}
