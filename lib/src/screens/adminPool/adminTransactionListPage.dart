import 'package:Jamiie/src/providers/transaction/adminTransactionListProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminTransactionListPage extends StatelessWidget {
  AdminTransactionListPage({this.poolId});
  final String poolId;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AdminTransationListProvider(),
      child: AdminTransactionListWidget(poolId: poolId,),
    );
  }
}

class AdminTransactionListWidget extends StatelessWidget {
  AdminTransactionListWidget({this.poolId});
  final String poolId;
  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);
    return Consumer<AdminTransationListProvider>(
      builder: (_, adminTransactionListProvider, child) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
          key: adminTransactionListProvider.scaffoldKey,
          body: FutureBuilder<Null>(
            future: adminTransactionListProvider.loadPageData(poolId),
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
                                  'Paid Users',
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
                                    itemCount: adminTransactionListProvider
                                        .adminPaidUserListModel
                                        .adminpaidUserList
                                        .length,
                                    itemBuilder: (context, index) {
                                      var data = adminTransactionListProvider
                                          .adminPaidUserListModel
                                          .adminpaidUserList[index];
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
                                                  data.phone,
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
                                                  data.paidTime.toString(),
                                                  style:
                                                      AppTextStyle.dashCardHint,
                                                ),
                                              data.loanPayment ?
                                                Text(
                                                   
                                                  "Loan",
                                                  style:
                                                      AppTextStyle.dashCardHint,
                                                )
                                                :
                                                Text(
                                                   
                                                  " ",
                                                  style:
                                                      AppTextStyle.dashCardHint,
                                                )
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
                        //           'Unpaid Users',
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
                        //             // itemCount: 5,
                        //             itemCount: adminTransactionListProvider
                        //                 .adminNotPaidUserListModel
                        //                 .adminnotPaidUserList
                        //                 .length,
                        //             itemBuilder: (context, index) {
                        //               var data = adminTransactionListProvider
                        //                   .adminNotPaidUserListModel
                        //                   .adminnotPaidUserList[index];
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
                        //                           data.phone,
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
                      "Error occured ",
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
