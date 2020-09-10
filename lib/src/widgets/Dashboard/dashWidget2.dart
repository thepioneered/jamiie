import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/Dashboard/dashCardModel.dart';
import 'package:flutter/material.dart';
import '../../styles/text.dart';

class DashWidget2 extends StatelessWidget {
  DashWidget2(this.transactionList);
  final List<Transaction> transactionList;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    Color color;
    String sign;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      padding: EdgeInsets.fromLTRB(20.h, 10.h, 20.h, 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 1.wp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Transactions',
            style: AppTextStyle.dashCardHeading(size: 18.sp),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.h),
            constraints: BoxConstraints(maxHeight: .34.hp),
            child: ScrollConfiguration(
              behavior: new ScrollBehavior()
                ..buildViewportChrome(context, null, AxisDirection.down),
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                itemCount: transactionList.length,
                itemBuilder: (context, index) {
                  if (transactionList[index].transactionType == "Received") {
                    color = Colors.green;
                    sign = '+';
                  } else {
                    color = Colors.red;
                    sign = '-';
                  }
                  return Container(
                    height: 45.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transactionList[index].name,
                              style: AppTextStyle.dashCardText(
                                color: Colors.black,
                                size: 14.sp,
                              ),
                            ),
                            Text(
                              sign +
                                  '\$' +
                                  transactionList[index].amount.toString(),
                              style: AppTextStyle.dashTransAmount(
                                  size: 18.sp, color: color),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              transactionList[index].transactionType,
                              style: AppTextStyle.dashCardHint(size: 10.sp),
                            ),
                            Text(
                              transactionList[index].date,
                              style: AppTextStyle.dashCardHint(size: 10.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // )
        ],
      ),
    );
  }
}
