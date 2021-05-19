import 'package:Jamiie/src/providers/userJoinedPools/joinPoolDataProvider.dart';
import 'package:Jamiie/src/screens/adminPool/transactionPage.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../styles/text.dart';
import '../../widgets/button/appButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/colors.dart';
import '../../widgets/appBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JoinPoolDataPage extends StatelessWidget {
  final String poolId;

  const JoinPoolDataPage({@required this.poolId});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => JoinPoolDataProvider(),
      child: JoinPoolDataPageWidget(
        poolId: poolId,
      ),
    );
  }
}

class JoinPoolDataPageWidget extends StatelessWidget {
  final String poolId;

  const JoinPoolDataPageWidget({Key key, this.poolId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 75.0;
    var joinPoolDataProvider = Provider.of<JoinPoolDataProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      body: FutureBuilder<Null>(
          future: joinPoolDataProvider.loadPage(poolId),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done &&
                !snapshot.hasError) {
              var data = joinPoolDataProvider.joinPoolDataModel;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
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
                                dataContainer(
                                    "Pool Id", data.poolId.toString()),
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
                                  Text(
                                    (index + 1).toString(),
                                    style: AppTextStyle.joinPoolHeading,
                                  ),
                                  SizedBox(
                                    width: 17.5,
                                  ),
                                  Container(
                                    width: 50.w,
                                    height: 50.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                        imageUrl: data.members[index]
                                            .memberDetails.imageURL,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                        placeholder: (context, url) =>
                                            CupertinoActivityIndicator(),
                                        errorWidget: (context, url, error) {
                                          return Icon(Icons.error);
                                        }),
                                  ),
                                  SizedBox(
                                    width: 17.5,
                                  ),
                                  Text(
                                    data.members[index].memberDetails.name,
                                    style: AppTextStyle.joinPoolSubHeading,
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Text(
                                    data.members[index].memberDetails.riskScore
                                        .toString(),
                                    style: AppTextStyle.joinPoolSubHeading,
                                  )
                                ],
                              ),
                            );
                          }),
                    ),

                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder(
                        future: joinPoolDataProvider.payButtonFridayCheck(),
                        builder: (_, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                                height: height * 0.07,
                                child: CupertinoActivityIndicator());
                          } else if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return SizedBox(
                              height: height * 0.07,
                              child: AppButton.loginButton(
                                onTap: data.payStatus
                                    ? () {}
                                    : () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => TransactionPage(
                                                    poolId: data.poolId,
                                                    poolName: data.poolName,
                                                  )),
                                          
                                        );
                                      },
                                title: "Pay",
                              ),
                            );
                          } else {
                            return Container(
                                child: Text("Error on join pool data page"));
                          }
                        }),
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
