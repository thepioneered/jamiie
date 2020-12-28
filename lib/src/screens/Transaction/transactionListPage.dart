import 'package:Jamiie/src/providers/transaction/transactionListProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../providers/Dashboard/dashboardProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransationListProvider(),
      child: TransactionListWidget(),
    );
  }
}

class TransactionListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    return Consumer<TransationListProvider>(
      builder: (_, transactionListProvider, child) {
        return Scaffold(
          key: transactionListProvider.transactionListPageScaffoldKey,
          body: FutureBuilder<Null>(
            future: transactionListProvider.loadPageData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (!snapshot.hasError &&
                  snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  child: Container(
                    color: AppColors.backgroundColor,
                    margin: EdgeInsets.only(top: 24.h),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.fromLTRB(20.h, 10.h, 20.h, 10.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          width: 1.wp,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Paid Pools',
                                  style: AppTextStyle.dashCardHeading,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 5.h),
                                constraints: BoxConstraints(maxHeight: .34.hp),
                                height: .34.hp,
                                child: ScrollConfiguration(
                                  behavior: new ScrollBehavior()
                                    ..buildViewportChrome(
                                        context, null, AxisDirection.down),
                                  child: ListView.builder(
                                    reverse: true,
                                    shrinkWrap: true,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.h),
                                  
                                    itemCount: transactionListProvider
                                        .paidUserListModel.paidUserList.length,
                                    itemBuilder: (context, index) {
                                      var data = transactionListProvider
                                          .paidUserListModel
                                          .paidUserList[index];
                                      return Container(
                                        height: 45.h,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.poolId,
                                                  style:
                                                      AppTextStyle.dashCardText(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  data.amount,
                                                  style: AppTextStyle
                                                      .dashTransAmount(
                                                    color: Colors.green,
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  data.payDate.toString(),
                                                  style:
                                                      AppTextStyle.dashCardHint,
                                                ),
                                                Text(
                                                  data.paidTime.toString(),
                                                  style:
                                                      AppTextStyle.dashCardHint,
                                                ),
                                              ],
                                            ),
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
                        ),
                        // Container(
                        //   margin: EdgeInsets.symmetric(vertical: 10.h),
                        //   padding: EdgeInsets.fromLTRB(20.h, 10.h, 20.h, 10.h),
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(16),
                        //   ),
                        //   width: 1.wp,
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Center(
                        //         child: Text(
                        //           'Unpaid Pools',
                        //           style: AppTextStyle.dashCardHeading,
                        //         ),
                        //       ),
                        //       Container(
                        //         padding: EdgeInsets.only(top: 5.h),
                        //         constraints: BoxConstraints(maxHeight: .34.hp),
                        //         // height: .34.hp,
                        //         child: ScrollConfiguration(
                        //           behavior: new ScrollBehavior()
                        //             ..buildViewportChrome(
                        //                 context, null, AxisDirection.down),
                        //           child: ListView.builder(
                        //             reverse: true,
                        //             shrinkWrap: true,
                        //             padding:
                        //                 EdgeInsets.symmetric(horizontal: 5.h),
                        //                 // itemCount: 5,
                        //             itemCount: transactionListProvider.notPaidUserListModel.notPaidUserList.length,
                        //             itemBuilder: (context, index) {
                        //               var data = transactionListProvider
                        //                   .notPaidUserListModel
                        //                   .notPaidUserList[index];
                        //               return Container(
                        //                 height: 45.h,
                        //                 child: Column(
                        //                   children: [
                        //                     Row(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment
                        //                               .spaceBetween,
                        //                       children: [
                        //                         Text(
                        //                           data.poolId,
                        //                           style:
                        //                               AppTextStyle.dashCardText(
                        //                             color: Colors.black,
                        //                           ),
                        //                         ),
                        //                         Text(
                        //                           data.amount,
                        //                           style: AppTextStyle
                        //                               .dashTransAmount(
                        //                             color: Colors.red,
                        //                           ),
                        //                         )
                        //                       ],
                        //                     ),
                        //                     Row(
                        //                       mainAxisAlignment:
                        //                           MainAxisAlignment
                        //                               .spaceBetween,
                        //                       children: [
                        //                         Text(
                        //                           data.payDate.toString(),
                        //                           style:
                        //                               AppTextStyle.dashCardHint,
                        //                         ),
                        //                         Text(
                        //                           data.paidTime.toString(),
                        //                           style:
                        //                               AppTextStyle.dashCardHint,
                        //                         ),
                        //                       ],
                        //                     ),
                        //                   ],
                        //                 ),
                        //               );
                        //             },
                        //           ),
                        //         ),
                        //       ),
                        //       // )
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              } else {
                try {
                  return Center(
                    child: Text(snapshot.error),
                  );
                } catch (e) {
                  return Center(
                    child: Text(
                      "Error occured in transaction page list page in catch block of else. Error is $e",
                    ),
                  );
                }
              }
            },
          ),
        );
      },
    );
  }
}
