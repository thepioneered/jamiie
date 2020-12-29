import 'package:Jamiie/src/screens/userJoinedPools/joinPoolDataPage.dart';
import 'package:Jamiie/src/screens/userJoinedPools/joinPoolScreen.dart';
import 'package:Jamiie/src/styles/text.dart';
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

class MyPoolWidget extends StatefulWidget {
  @override
  _MyPoolWidgetState createState() => _MyPoolWidgetState();
}

class _MyPoolWidgetState extends State<MyPoolWidget> {
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
          Navigator.pushNamed(context, "/SearchPoolPage").then(
            (value) => setState(
              () {},
            ),
          );
        },
      ),
      body: FutureBuilder<Null>(
        future: joinPoolProvider.loadPageAsset(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (!snapshot.hasError) {
            return joinPoolProvider
                    .joinPoolListModel.joinPoolListDataModel.isEmpty
                 ? Container(
                    child: Center(
                      child: Text('No Pools Joined',style: AppTextStyle.joinPoolSubHeading),
                    ),
                  )
                : SingleChildScrollView(
                                  child: Container(
                      padding: EdgeInsets.only(top:30.0.h),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
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
                                var data = joinPoolProvider.joinPoolListModel
                                    .joinPoolListDataModel[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                                  child: JoinPoolListWidget(
                                    status: true,
                                        // data.joinedPoolListDataSubModel.status,
                                    amountSaved: 0000,
                                    monthlyTotalAmount: 0000,
                                    poolAmount: data.joinedPoolListDataSubModel
                                        .contributionAmount,
                                    poolName:
                                        data.joinedPoolListDataSubModel.poolName,
                                    poolType:
                                        data.joinedPoolListDataSubModel.poolType,
                                    nextScreen: JoinPoolDataPage(poolId: data.joinedPoolListDataSubModel.poolId,),
                                  ),
                                );
                              },
                              itemCount: joinPoolProvider
                                  .joinPoolListModel.joinPoolListDataModel.length,
                            ),
                          ),
                        ],
                      ),
                    ),
                );
          } else if (snapshot.error == 404) {
            return Center(
              child: Text("No pools created"),
            );
          } else {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
        },
      ),
    );
  }
}
