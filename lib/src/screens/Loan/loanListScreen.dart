import 'package:Jamiie/src/providers/Loan/loanListProvider.dart';
import 'package:Jamiie/src/screens/Loan/loanDataPage.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:Jamiie/src/widgets/topHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoanListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoanListProvider(),
      child: LoanListScreenWidget(),
    );
  }
}

class LoanListScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoanListProvider>(
        builder: (_, loanListScreenProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
        key: loanListScreenProvider.scaffoldKey,
        body: FutureBuilder<Null>(
            future: loanListScreenProvider.loadPageData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (!snapshot.hasError &&
                  snapshot.connectionState == ConnectionState.done) {
                return Container(
                  //padding: BaseStyles.pagePadingDashboard,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      topHeading(title: "Your Loan"),
                      SizedBox(
                        height: 0.04.hp,
                      ),
                      Container(
                        height: 490.h,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var data = loanListScreenProvider
                                .loanListModel.loanList[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: ListTile(
                                title: Text(data.poolId),
                                subtitle: Text(data.createdAt.substring(0,10)),
                                trailing: Text(data.amount.toString(),style: TextStyle(
                                  color: Colors.green
                                ),),
                                onTap: () {
                                  Navigator.push(

                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoanDataPage(
                                                amount: data.amount,
                                                createdAt: data.createdAt,
                                                phone: data.phone,
                                                poolId: data.poolId,
                                                transactionId:
                                                    data.transactionId,
                                              ))
                                              ).then((value) => loanListScreenProvider.notifyListeners());
                                },
                              ),
                            );
                          },
                          itemCount: loanListScreenProvider
                              .loanListModel.loanList.length,
                        ),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.error == 404) {
               return  Center(
                  child: Text("No Loans",style: AppTextStyle.forgotPassword()),
                );
              } else {
                try {
                  return Center(
                    child: Text(snapshot.error),
                  );
                } catch (e) {
                  return Center(
                    child: Text(
                      "Error occured",
                    ),
                  );
                }
              }
            }),
      );
    });
  }
}
