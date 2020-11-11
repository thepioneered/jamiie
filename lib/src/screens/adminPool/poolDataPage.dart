import 'package:Jamiie/src/screens/Transaction/transactionListPage.dart';
import 'package:Jamiie/src/screens/Transaction/transactionPage.dart';

import '../../models/adminPoolModel/completePoolDataModel.dart';
import '../../providers/adminPool/completePoolDataProvider.dart';
import 'roundListPage.dart';
import '../../styles/text.dart';
import '../../widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';

class CompletePoolDataPage extends StatelessWidget {
  final String poolId;

  const CompletePoolDataPage({@required this.poolId});
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
            } else if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasError) {
              var data = completePoolDataProvider.completePoolDataModel;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Container(
                    //   child: Row(
                    //     children: [
                    //       Text(
                    //           '${data.joinedMember.toString()} / ${data.totalMember.toString()}'),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      height: height * 0.35,
                      child: Row(
                        children: [
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 30.0) / 2,
                            child: Column(
                              children: [
                                dataContainer("Pool Name", data.poolName),
                                dataContainer("Pool Owner", data.poolOwner),
                                dataContainer("Pool Type", data.poolType),
                              ],
                            ),
                          ),
                          Container(
                            width:
                                (MediaQuery.of(context).size.width - 30.0) / 2,
                            child: Column(
                              children: [
                                dataContainer("Amount",
                                    data.contributionAmount.toString()),
                                dataContainer("Members",
                                    "${data.joinedMember.toString()}/${data.totalMember.toString()}"),
                                
                                dataContainer("Pool Id",
                                    data.poolId.toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    //60 percent of total height
                    Container(
                      height: height * 0.45,
                      child: ListView.builder(
                          controller:
                              ScrollController(initialScrollOffset: 0.0),
                          itemCount: data.members.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 60.0,
                              padding: EdgeInsets.all(10.0),
                              margin: EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                children: [
                                  Text((index + 1).toString()),
                                  SizedBox(
                                    width: 17.5,
                                  ),
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(data
                                        .members[index].memberDetails.imageURL),
                                  ),
                                  SizedBox(
                                    width: 17.5,
                                  ),
                                  Text(data.members[index].memberDetails.name),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text(data
                                      .members[index].memberDetails.riskScore
                                      .toString())
                                ],
                              ),
                            );
                          }),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),

                    // 7 percent of total height
                    Container(
                      height: height * 0.07,
                      child: AppButton.loginButton(
                        onTap: data.totalMember == data.joinedMember
                            ? () {
                                print("Working");
                              }
                            : () {
                                //TODO: Edit is required here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ChooseRoundPage(
                                      memberModel: data.members,
                                    ),
                                  ),
                                );
                              },
                        title: "Start Pool",
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: height * 0.07,
                      child: AppButton.loginButton(
                        onTap: data.totalMember == data.joinedMember
                            ? () {
                                print("Working");
                              }
                            : () {
                                //TODO: Edit is required here
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Transactionpage(poolId: data.poolId,poolName: data.poolName,)
                                  ),
                                );
                              },
                        title: "Pay",
                      ),
                    ),
                  ],
                ),
              );
            } else {
              print(snapshot.error);
              return Center(
                child: Text("Checl"),
              );
            }
          }),
    );
  }

  static Widget dataContainer(String title, String data) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title :',
            style: AppTextStyle.joinPoolHeading,
          ),
          SizedBox(
            height: 3.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.0,
              ),
              Text(data, style: AppTextStyle.joinPoolSubHeading),
            ],
          ),
        ],
      ),
    );
  }
}
