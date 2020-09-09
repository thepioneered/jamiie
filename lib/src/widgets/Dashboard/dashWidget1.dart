import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: height * .43,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColorPurple,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(20),
            width: width / 2 - 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeText(
                  'Money saved with us',
                  maxLines: 2,
                  style: AppTextStyle.dashCardText(AppColors.lightBlue),
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
                      AutoSizeText(
                        amount.toString(),
                        maxLines: 2,
                        style: AppTextStyle.dashCardNumber(AppColors.white),
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
                      width: (width / 2 - 30) / 8,
                      height: height * .11,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: (width / 2 - 30) / 8,
                      height: height * .19,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: (width / 2 - 30) / 8,
                      height: height * .14,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.lightBlue,
                          borderRadius: BorderRadius.circular(20)),
                      width: (width / 2 - 30) / 8,
                      height: height * .1,
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
            padding: EdgeInsets.all(10),
            width: width / 2 - 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Created Pools',
                        maxLines: 1,
                        style: AppTextStyle.dashCardText(
                            AppColors.primaryColorPurple),
                      ),
                      AutoSizeText(
                        createsPools.toString(),
                        maxLines: 1,
                        style: AppTextStyle.dashCardNumber(
                            AppColors.primaryColorPurple),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Joined Pools',
                        maxLines: 1,
                        style: AppTextStyle.dashCardText(
                            AppColors.primaryColorPurple),
                      ),
                      AutoSizeText(
                        joinedPools.toString(),
                        maxLines: 1,
                        style: AppTextStyle.dashCardNumber(
                            AppColors.primaryColorPurple),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        'Completed',
                        maxLines: 1,
                        style: AppTextStyle.dashCardText(
                            AppColors.primaryColorPurple),
                      ),
                      AutoSizeText(
                        completedPools.toString(),
                        maxLines: 1,
                        style: AppTextStyle.dashCardNumber(
                            AppColors.primaryColorPurple),
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
