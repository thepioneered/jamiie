import 'package:Jamiie/src/widgets/Dashboard/dashWidget1.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget2.dart';
import 'package:Jamiie/src/widgets/Dashboard/dashWidget3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/Dashboard/dashboardProvider.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../widgets/topHeading.dart';


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
    String imgUrl =
        "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb";
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
            } else if (!snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Container(
                  color: AppColors.backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          topHeading(
                              title: "Hello," +
                                  dashboardProvider.dashboardModel.name),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryBlue,
                              backgroundImage: NetworkImage(imgUrl),
                            ),
                          )
                        ],
                      ),
                      DashWidget1(
                        amount: dashboardProvider.dashboardModel.moneySaved,
                        joinedPools: dashboardProvider.dashboardModel.joinedPools,
                        createsPools:
                            dashboardProvider.dashboardModel.createdPools,
                        completedPools:
                            dashboardProvider.dashboardModel.completedPools,
                      ),
                      DashWidget2(dashboardProvider.dashboardModel.transaction),
                      DashWidget3(dashboardProvider.dashboardModel.upcomingPayment),
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
