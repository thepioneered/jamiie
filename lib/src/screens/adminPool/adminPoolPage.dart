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
        onPressed: () async {
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
                    SizedBox(
                      height: 0.04.hp,
                    ),
                    Container(
                      height: 490.h,
                      child: ListView.builder(
                        itemCount:
                            createdPoolList.poolListModel.poolDataModel.length,
                        itemBuilder: (context, index) {
                          var data =
                              createdPoolList.poolListModel.poolDataModel;
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
                              monthlyTotalAmount:
                                  data[index].contributionAmount,
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
}
