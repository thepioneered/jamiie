import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/text.dart';

class DashWidget3 extends StatelessWidget {
  DashWidget3(this.upcomingPaymentList);
  final List<UpcomingPayments> upcomingPaymentList;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
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
            'Upcoming Payments',
            style: AppTextStyle.dashCardHeading(size: 18.sp),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: .34.hp),
            padding: EdgeInsets.only(top: 5),
            child: ScrollConfiguration(
              behavior: new ScrollBehavior()
                ..buildViewportChrome(context, null, AxisDirection.down),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 5.h),
                itemBuilder: (context, index) {
                  return Container(
                    height: 45.h,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              upcomingPaymentList[index].name,
                              style: AppTextStyle.dashCardText(
                                color: Colors.black,
                                size: 14.sp,
                              ),
                            ),
                            Text(
                              '\$${upcomingPaymentList[index].amount}',
                              style: AppTextStyle.dashTransAmount(
                                  size: 18.sp, color: AppColors.green),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              upcomingPaymentList[index].date,
                              style: AppTextStyle.dashCardHint(size: 10.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
                itemCount: upcomingPaymentList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
