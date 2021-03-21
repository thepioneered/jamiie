import '../../styles/base.dart';
import '../../widgets/topHeading.dart';
import '../../widgets/userJoinedPools/joinPoolListWidget.dart';

import 'poolDataPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/adminPool/adminPoolProvider.dart';
import 'package:provider/provider.dart';
import '../../styles/text.dart';
import '../../styles/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminPoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AdminPoolProvider(),
      child: AdminPoolWidget(),
    );
  }
}

class AdminPoolWidget extends StatefulWidget {
  @override
  _AdminPoolWidgetState createState() => _AdminPoolWidgetState();
}

class _AdminPoolWidgetState extends State<AdminPoolWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    var createdPoolList = Provider.of<AdminPoolProvider>(context);
    return Scaffold(
      key: createdPoolList.listOfCreatedPoolsScaffoldKey,
      backgroundColor: Color(0XFFf5f7fb),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColorPurple,
        tooltip: "Create Pool",
        onPressed:

            // createdPoolList.poolListModel.poolDataModel.length==0
            //     ? () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (_) => Transactionpage()));
            //       }
            //     :
            () async {
          await Navigator.pushNamed(
            context,
            '/CreatePoolPage',
            arguments: "Dataaaaaaa",
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<Null>(
        future: createdPoolList.loadPage(),
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (!snapshot.hasError) {
            return SingleChildScrollView(
              child: Container(
            padding: BaseStyles.pagePadingDashboard,
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    topHeading(title: "Created Pools"),
                    SizedBox(height: 0.04.hp,),

                    // Text(
                    //   'Created Pools',
                    //   style: TextStyle(
                    //       fontFamily: 'poppins',
                    //       fontSize: 36.sp,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    Container(
                      height: 490.h,
                      child: ListView.builder(
                        // reverse: true,
                        itemCount:
                            createdPoolList.poolListModel.poolDataModel.length,
                        itemBuilder: (context, index) {
                          var data =
                              createdPoolList.poolListModel.poolDataModel;
                          // return _data(
                          //     poolName: data[index].poolName,
                          //     poolContribution: data[index].contributionAmount,
                          //     poolId: data[index].poolId);
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: JoinPoolListWidget(
                              poolName: data[index].poolName,
                              poolAmount: data[index].contributionAmount,
                              amountSaved: data[index].contributionAmount,
                              status: true,
                              poolType: data[index].poolType,
                              nextScreen: CompletePoolDataPage(
                                  poolId: data[index].poolId),
                              monthlyTotalAmount: data[index].contributionAmount,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.error == 404) {
            return Center(
              child: Text(
                "No pools created",
                style: AppTextStyle.joinPoolSubHeading,
              ),
            );
          } else {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
        },
      ),
    );
  }

  // Widget _data({
  //   @required String poolName,
  //   @required int poolContribution,
  //   @required String poolId,
  // }) {
  //   return Container(
  //     margin: EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
  //     alignment: Alignment.center,
  //     child: GestureDetector(
  //       onTap: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (_) => CompletePoolDataPage(
  //               poolId: poolId,
  //             ),
  //           ),
  //         );
  //       },
  //       child: Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.all(15.0),
  //         height: MediaQuery.of(context).size.height / 2.5,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: <Widget>[
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   poolName,
  //                   style: AppTextStyle.poolTitle,
  //                 ),

  //                 Container(
  //                   padding: EdgeInsets.only(
  //                       left: 7.5, right: 7.5, top: 3.0, bottom: 3.0),
  //                   decoration: BoxDecoration(
  //                     color: Colors.red,
  //                     borderRadius: BorderRadius.circular(15.0),
  //                   ),
  //                   child: Text(
  //                     "Pending",
  //                     style: TextStyle(color: AppColors.white),
  //                   ),
  //                 )
  //                 // GestureDetector(
  //                 //   onTap: () {
  //                 //     Share.share(
  //                 //       AppConstString.sharePoolId(
  //                 //         poolId,
  //                 //       ),
  //                 //     );
  //                 //   },
  //                 //   child: Icon(Icons.share),
  //                 // ),
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Container(
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         "\$ ${poolContribution.toString()}",
  //                         style: AppTextStyle.amountStyle,
  //                       ),
  //                       Text("Monthly per person",
  //                           style: AppTextStyle.amountSubHeading)
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(4.0),
  //           color: AppColors.white,
  //           boxShadow: [
  //             BoxShadow(
  //               color: Colors.grey,
  //               offset: Offset(0.0, 1.0),
  //               blurRadius: 6.0,
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
