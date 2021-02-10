import 'package:Jamiie/src/screens/Loan/repayLoanPage.dart';
import 'package:Jamiie/src/screens/adminPool/transactionPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../styles/text.dart';
import '../../widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoanDataPage extends StatelessWidget {
  final String poolId;
  final int amount;
  final String phone;
  final String createdAt;
  final String transactionId;

  LoanDataPage({
    this.poolId,
    this.amount,
    this.createdAt,
    this.phone,
    this.transactionId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 1.wp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pool Id:', style: AppTextStyle.subheadingText),
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
                  Text('Phone:', style: AppTextStyle.subheadingText),
                  Text(
                    phone,
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
                  Text('Date:', style: AppTextStyle.subheadingText),
                  Text(
                    createdAt.substring(0, 10),
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 26.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 0.07.hp,
              child: AppButton.loginButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RepayLoanPage(
                        amount: amount,
                        poolId: poolId,
                        transactionId: transactionId,
                      ),
                    ),
                  );
                },
                title: "Pay",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
