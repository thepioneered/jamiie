import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget1.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget2.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget3.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/Dashboard/dashboardProvider.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TransactionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardProvider(),
      child: TransactionListWidget(),
    );
  }
}

class TransactionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    return Consumer<DashboardProvider>(builder: (_, dashboardProvider, child) {
      return Scaffold(
        key: dashboardProvider.dashboardScaffoldKey,
        body: FutureBuilder<Null>(
          future: dashboardProvider.loadPageAsset(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (!snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              var data = dashboardProvider.dashboardModel;
              Color color;
              String sign;
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                padding: EdgeInsets.fromLTRB(15.h, 10.h, 15.h, 0.h),
                width: 1.wp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Transactions',
                        style: TextStyle(
                            fontFamily: 'poppins',
                            fontSize: 36.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: ScrollConfiguration(
                        behavior: new ScrollBehavior()
                          ..buildViewportChrome(
                              context, null, AxisDirection.down),
                        child: ListView.builder(
                          reverse: true,
                          shrinkWrap: true,
                          itemCount: data.transaction.length,
                          itemBuilder: (context, index) {
                            if (data.transaction[index].transactionType ==
                                "Received") {
                              color = Colors.green;
                              sign = '+';
                            } else {
                              color = Colors.red;
                              sign = '-';
                            }
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data.transaction[index].name,
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 20.sp,
                                        ),
                                      ),
                                      Text(
                                        sign +
                                            '\$' +
                                            data.transaction[index].amount
                                                .toString(),
                                        style: TextStyle(
                                          fontFamily: 'poppins',
                                          fontSize: 20.sp,
                                          color: color,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        data.transaction[index].date,
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12.sp),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.sp,),
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
            } else {
              return Center(
                child: Text(snapshot.error),
              );
            }
          },
        ),
      );
    });
  }
}
