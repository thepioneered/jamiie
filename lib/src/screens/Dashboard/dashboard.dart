import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
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
                                  style: AppTextStyle.dashHeading,
                                ),
                              ),

                              Container(
                                width: 50.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: CachedNetworkImage(
                                    imageUrl: data.imgUrl,
                                    placeholder: (context, url) =>
                                        CupertinoActivityIndicator(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
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
                                ],
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                height: 0.07.hp,
                                child: AppButton.loginButton(
                                  title: "Create Pool",
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/CreatePoolPage");
                                  },
                                ),
                              ),
                        data.response
                            ? Column(
                                children: [
                                  DashWidget3(data.upcomingPaymentList),
                                ],
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(vertical: 10.h),
                                height: 0.07.hp,
                                child: AppButton.loginButton(
                                  title: "Join Pool",
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/SearchPoolPage");
                                  },
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
