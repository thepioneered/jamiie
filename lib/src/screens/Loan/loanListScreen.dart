import 'package:Jamiie/src/providers/Loan/loanListProvider.dart';
import 'package:Jamiie/src/styles/base.dart';
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
                return loanListScreenProvider.loanListModel.loanList.isEmpty
                    ? Container(
                        child: Center(
                          child: Text('No Loans Found',
                              style: AppTextStyle.joinPoolSubHeading),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Container(
                          padding: BaseStyles.pagePadingDashboard,
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
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: ListTile(
                                        title: Text(data.poolId),
                                        subtitle: Text(data.createdAt),
                                        trailing: Text(data.amount.toString()),
                                      ),
                                    );
                                  },
                                  itemCount: loanListScreenProvider
                                      .loanListModel.loanList.length,
                                ),
                              ),
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
