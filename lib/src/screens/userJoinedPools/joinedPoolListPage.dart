import 'package:Jamiie/src/screens/userJoinedPools/joinPoolScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../providers/userJoinedPools/joinPoolProvider.dart';
import '../../styles/colors.dart';
import '../../widgets/userJoinedPools/joinPoolListWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/icons.dart';

class MyPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JoinPoolProvider(),
      child: MyPoolWidget(),
    );
  }
}

class MyPoolWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    var joinPoolProvider = Provider.of<JoinPoolProvider>(context);
    return Scaffold(
      key: joinPoolProvider.listOfJoinedPoolScaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColorPurple,
        child: AppIcons.searchIcon,
        onPressed: () {
          Navigator.pushNamed(context, "/SearchPoolPage");
        },
      ),
      body: FutureBuilder<Null>(
        future: joinPoolProvider.loadPageAsset(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return Container(
              margin: EdgeInsets.only(top: 24.0.h),
              child: Column(
                children: [
                  Text(
                    'Joined Pools',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 36.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 545.h,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var data = joinPoolProvider
                            .joinPoolListModel.joinPoolListDataModel[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: JoinPoolListWidget(
                            status: data.status,
                            amountSaved: data.amountSaved,
                            monthlyTotalAmount: data.monthlyTotalAmount,
                            poolAmount: data.poolAmount,
                            poolName: data.poolName,
                            poolType: data.poolType,
                            nextScreen: JoinPoolScreen(),
                          ),
                        );
                      },
                      itemCount: joinPoolProvider
                          .joinPoolListModel.joinPoolListDataModel.length,
                    ),
                  ),
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
  }
}
