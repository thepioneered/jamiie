import '../../styles/colors.dart';
import '../../styles/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinPoolListWidget extends StatelessWidget {
  final String poolName;
  final int poolAmount;
  final String poolType;
  final int monthlyTotalAmount;
  final int amountSaved;
  final bool status;

  final Object nextScreen;

  JoinPoolListWidget({
    @required this.poolName,
    @required this.poolAmount,
    @required this.poolType,
    @required this.monthlyTotalAmount,
    @required this.amountSaved,
    @required this.status,
    @required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    if (status) {
      return GestureDetector(
        onTap: () {
          //Todo
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (_) => PoolScreen()));
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => nextScreen));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 15.0.h),
          alignment: Alignment.center,
          width: double.infinity,
          padding: EdgeInsets.all(15.0.h),
          height: 245.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ),
                  Text(
                    poolName,
                    style: AppTextStyle.poolTitle,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("\$ " + poolAmount.toString(),
                            style: AppTextStyle.amountStyle),
                        Text(poolType + " per person",
                            style: AppTextStyle.amountSubHeading),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$ " + monthlyTotalAmount.toString(),
                          style: AppTextStyle.poolMonthlyTotalAmount),
                      Text("$poolType Total",
                          style: AppTextStyle.amountSubHeading),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$ " + amountSaved.toString(),
                          style: AppTextStyle.poolAmountSaved),
                      Text("Money Saved", style: AppTextStyle.amountSubHeading),
                    ],
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                blurRadius: 6.0,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 15.0.sp),
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.all(15.0.h),
        height: 245.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  poolName,
                  style: AppTextStyle.poolTitle,
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 7.5.w, right: 7.5.w, top: 3.0.h, bottom: 3.0.h),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Pending",
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "poppins",
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\$ " + poolAmount.toString(),
                        style: AppTextStyle.amountStyle,
                      ),
                      Text(
                        poolType + " per person",
                        style: AppTextStyle.amountSubHeading,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$ " + monthlyTotalAmount.toString(),
                        style: AppTextStyle.poolMonthlyTotalAmount),
                    Text("$poolType Total",
                        style: AppTextStyle.amountSubHeading),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ " + amountSaved.toString(),
                      style: AppTextStyle.poolAmountSaved,
                    ),
                    Text("Money Saved", style: AppTextStyle.amountSubHeading),
                  ],
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 0),
              blurRadius: 6.0,
            ),
          ],
        ),
      );
    }
  }
}
