import 'package:Jamiie/src/screens/userJoinedPools/joinPoolScreen.dart';

import '../../providers/userJoinedPools/joinPoolProvider.dart';
import '../../styles/colors.dart';
import '../../widgets/userJoinedPools/joinPoolListWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/icons.dart';

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
            return Container(
              margin: EdgeInsets.only(top: 24.0),

              //height: MediaQuery.of(context).size.height * 2,
              child: Column(
                children: [
                  Text(
                    'Joined Pools',
                    style: TextStyle(
                        fontFamily: 'poppins',
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .8,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        var data = joinPoolProvider
                            .joinPoolListModel.joinPoolListDataModel[index];
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: JoinPoolListWidget(
                            status: data.status,

                            amountSaved: data.amountSaved,
                            // membersList: data.membersList,
                            monthlyTotalAmount: data.monthlyTotalAmount,
                            poolAmount: data.poolAmount,
                            poolName: data.poolName,
                            poolType: data.poolType,
                            nextScreen: JoinPoolScreen(),
                          ),
                        );
                      },
                      itemCount: joinPoolProvider
                          .joinPoolListModel.joinPoolListDataModel.length,
                    ),
                  ),
                ],
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
