import 'package:Jamiie/src/models/createPoolModels/poolidModel.dart';
import 'package:Jamiie/src/models/userJoinedPools/joinPoolListModel.dart';
import 'package:Jamiie/src/providers/userJoinedPools/joinPoolProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/widgets/userJoinedPools/joinPoolListWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../styles/base.dart';
import '../../utils/icons.dart';
import '../../widgets/topHeading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JoinPoolProvider(),
      child: MyPoolWidget(),
    );
  }
}

class MyPoolWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var joinPoolProvider = Provider.of<JoinPoolProvider>(context);
    return Scaffold(
      key: joinPoolProvider.listOfJoinedPoolScaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColorPurple,
        child: AppIcons.searchIcon,
        onPressed: () {
          Navigator.pushNamed(context, "/SearchPoolPage");
        },
      ),
      body: FutureBuilder<Null>(
        future: joinPoolProvider.loadPageAsset(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: BaseStyles.topPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    topHeading(title: "My Pool's"),
                    SingleChildScrollView(
                      child: Container(
                     //   color: Colors.red,
                        height: MediaQuery.of(context).size.height * 2,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return JoinPoolListWidget(
                              joinPoolProvider.joinPoolListModel
                                  .joinPoolListDataModel[index].poolProfile,
                              joinPoolProvider.joinPoolListModel
                                  .joinPoolListDataModel[index].poolName,
                              joinPoolProvider.joinPoolListModel
                                  .joinPoolListDataModel[index].poolAmount,
                              joinPoolProvider.joinPoolListModel
                                  .joinPoolListDataModel[index].poolType,
                              joinPoolProvider
                                  .joinPoolListModel
                                  .joinPoolListDataModel[index]
                                  .monthlyTotalAmount,
                              joinPoolProvider.joinPoolListModel
                                  .joinPoolListDataModel[index].amountSaved,
                              joinPoolProvider.joinPoolListModel
                                  .joinPoolListDataModel[index].membersList,
                            );
                          },
                          itemCount: joinPoolProvider
                              .joinPoolListModel.joinPoolListDataModel.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text(snapshot.error),
            );
          }
        },
      ),
    );
  }
}
