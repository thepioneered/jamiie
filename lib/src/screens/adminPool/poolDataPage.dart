import 'package:Jamiie/src/repositry/testData.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';

class PoolDataPage extends StatelessWidget {
  final String poolId;

  PoolDataPage({this.poolId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: ListView(
          // child:

          //  Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          //   child:

          children: [
            Column(
              children: [
                Container(
                  height: 300.0,
                  child: ListView.builder(
                      itemCount: TestData.peopleJoinedPools.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          height: 75.0,
                          child: Row(
                            children: [
                              Text(
                                "1.",
                                style: AppTextStyle.poolDataText,
                              ),
                              SizedBox(
                                width: 18.0,
                              ),
                              CircleAvatar(
                                radius: 30.0,
                              ),
                              SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                TestData.peopleJoinedPools[index].name,
                                style: AppTextStyle.poolDataText,
                              ),
                              Expanded(
                                child: Container(),
                              ),
                              Text(
                                TestData.peopleJoinedPools[index].riskScore,
                                style: AppTextStyle.poolDataText,
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ]),
      // ),
    );
  }
}
