import 'package:Jamiie/src/providers/adminPool/completePoolDataProvider.dart';
import 'package:Jamiie/src/repositry/testData.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';

class CompletePoolDataPage extends StatelessWidget {
  final String poolId;

  const CompletePoolDataPage({Key key, this.poolId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CompletePoolDataProvider(),
      child: PoolDataPageWidget(
        poolId: poolId,
      ),
    );
  }
}

class PoolDataPageWidget extends StatelessWidget {
  final String poolId;

  const PoolDataPageWidget({Key key, this.poolId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 75.0;
    var completePoolDataProvider =
        Provider.of<CompletePoolDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: FutureBuilder<Null>(
          future: completePoolDataProvider.loadPage(poolId),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else {
              var data = completePoolDataProvider.completePoolDataModel;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                              '${data.joinedMember.toString()} / ${data.totalMember.toString()}'),
                        ],
                      ),
                    ),
                    Container(
                      height: height * 0.60,
                      child: ListView.builder(
                          controller:
                              ScrollController(initialScrollOffset: 0.0),
                          itemCount: 10,
                          // itemCount: data.members.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 60.0,
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              color: AppColors.green,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text((index + 1).toString()),
                                  SizedBox(
                                    width: 17.5,
                                  ),
                                  CircleAvatar(),
                                  SizedBox(
                                    width: 17.5,
                                  ),
                                  Text(data.members[0].memberDetails.name),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text("20")
                                ],
                              ),
                            );
                          }),
                    ),
                    Container(
                      height: height * 0.07,
                      child: AppButton.loginButton(
                        onTap: data.totalMember == data.joinedMember
                            ? () {
                                print("Working");
                              }
                            : null,
                        title: "Start Pool",
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
