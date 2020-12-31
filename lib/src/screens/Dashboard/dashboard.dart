import '../../styles/text.dart';
import '../../widgets/Dashboard/dashWidget1.dart';
import '../../widgets/Dashboard/dashWidget2.dart';
import '../../widgets/Dashboard/dashWidget3.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/Dashboard/dashboardProvider.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
 return Consumer<DashboardProvider>(
      builder: (_, dashboardProvider, child) {
        return Scaffold(
          key: dashboardProvider.dashboardScaffoldKey,
          body: FutureBuilder<Null>(
            future: dashboardProvider.loadPageAsset(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
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
                            children: [
                              Container(
                                width: .75.wp,
                                child: AutoSizeText(
                                  "Hello, " +
                                      data.name
                                          .substring(0, data.name.indexOf(' ')),
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 36.sp,
                                      //TODO: size editor pending
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "poppins"),
                                ),
                              ),

                              Container(
                                width: 50.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CachedNetworkImage(
                                    imageUrl: data.imgUrl,
                                    placeholder: (context, url) =>
                                        CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) {
                                      return Icon(Icons.error);
                                    }),
                              ),
                              // )
                            ],
                          ),
                        ),
                        DashWidget1(
                          amount: data.moneySaved == null ? 0 : data.moneySaved,
                          joinedPools: data.joinedPools - data.createdPools,
                          createsPools: data.createdPools,
                          completedPools: data.completedPools,
                        ),
                        data.response
                            ? Column(
                                children: [
                                  DashWidget2(data.transactionList),
                                  DashWidget3(data.upcomingPaymentList),
                                ],
                              )
                            : Container(
                                height: 0.3.hp,
                                child: Center(
                                  child: Text(
                                    "No transaction yet",
                                    style: AppTextStyle.joinPoolSubHeading,
                                  ),
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
      },
    );
  }
}
