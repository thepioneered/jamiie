import 'package:Jamiie/src/widgets/Dashboard/dashWidget1.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget2.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/Dashboard/dashboardProvider.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DashboardProvider(),
      child: DashboardPageWidget(),
    );
  }
}

class DashboardPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    // print(ScreenUtil.screenHeight);
    // print(ScreenUtil.screenWidth);
    // print(ScreenUtil.screenHeightPx);
    // print(ScreenUtil.screenWidthPx);
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
              return SingleChildScrollView(
                child: Container(
                  color: AppColors.backgroundColor,
                  margin: EdgeInsets.only(top: 24.h),

                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Hello," + data.name,
                              style: TextStyle(
                                  fontSize: 36.sp,
                                  //TODO: size editor
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "poppins"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 20.w),
                              child: CircleAvatar(
                                backgroundColor: AppColors.primaryBlue,
                                backgroundImage: NetworkImage(data.imgUrl),
                              ),
                            )
                          ],
                        ),
                      ),
                      DashWidget1(
                        amount: data.moneySaved,
                        joinedPools: data.joinedPools,
                        createsPools: data.createdPools,
                        completedPools: data.completedPools,
                      ),
                      DashWidget2(data.transaction),
                      DashWidget3(data.upcomingPayment),
                    ],
                  ),
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
