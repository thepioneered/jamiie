import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';

class DashWidget1 extends StatelessWidget {
  DashWidget1({
    @required this.amount,
    @required this.joinedPools,
    @required this.completedPools,
    @required this.createsPools,
  });
  final int amount;
  final int createsPools;
  final int joinedPools;
  final int completedPools;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      height: 0.43.hp,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColorPurple,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(20.h),
            width: 182.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Money saved with us',
                  style: AppTextStyle.dashCardText(
                    color: AppColors.lightBlue,
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '\$',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        amount.toString(),
                        style: AppTextStyle.dashCardNumber(
                          color: AppColors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: 22.w,
                      height: .11.hp,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: 22.w,
                      height: .19.hp,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: 22.w,
                      height: .14.hp,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: 22.w,
                      height: .1.hp,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(10.h),
            width: 182.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10.h, 10.h, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Created Pools',
                        style: AppTextStyle.dashCardText(
                          color: AppColors.primaryColorPurple,
                        ),
                      ),
                      Text(
                        createsPools.toString(),
                        style: AppTextStyle.dashCardNumber(
                          color: AppColors.primaryColorPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.h, 10.h, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Joined Pools',
                        style: AppTextStyle.dashCardText(
                          color: AppColors.primaryColorPurple,
                        ),
                      ),
                      Text(
                        joinedPools.toString(),
                        style: AppTextStyle.dashCardNumber(
                          color: AppColors.primaryColorPurple,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10.h, 10.h, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Completed',
                        style: AppTextStyle.dashCardText(
                          color: AppColors.primaryColorPurple,
                        ),
                      ),
                      Text(
                        completedPools.toString(),
                        style: AppTextStyle.dashCardNumber(
                          color: AppColors.primaryColorPurple,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
