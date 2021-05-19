import 'package:Jamiie/src/providers/Loan/loanScreenProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoanScreen extends StatelessWidget {
  LoanScreen({this.poolAmount, this.poolId});
  final String poolAmount;
  final String poolId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoanScreenProvider(),
      child: LoanScreenWidget(
        poolAmount: poolAmount,
        poolId: poolId,
      ),
    );
  }
}

class LoanScreenWidget extends StatelessWidget {
  LoanScreenWidget({this.poolAmount, this.poolId});
  final String poolId;
  final String poolAmount;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var loanProvider = Provider.of<LoanScreenProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      key: loanProvider.scaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: FutureBuilder<Null>(
        future: loanProvider.loadPageData(poolId),
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
                          Text('Pool Amount:',
                              style: AppTextStyle.subheadingText),
                          Text(
                            poolAmount,
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          Text('Total Interest:',
                              style: AppTextStyle.subheadingText),
                          Text(
                            loanProvider.loanModel.interest.toString() + " %",
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                          Text('Total Amount:',
                              style: AppTextStyle.subheadingText),
                          Text(
                            (loanProvider.loanModel.amount +
                                    int.parse(poolAmount))
                                .toString(),
                            style: TextStyle(
                              fontFamily: 'poppins',
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 0.07.hp,
                      child: AppButton.loginButton(
                        onTap: () {
                          print('working');
                          loanProvider.confirmLoan(poolId);
                        },
                        title: "Confirm Loan",
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
