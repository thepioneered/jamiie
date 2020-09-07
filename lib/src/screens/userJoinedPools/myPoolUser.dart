import 'package:Jamiie/src/models/createPoolModels/poolidModel.dart';
import 'package:Jamiie/src/models/userJoinedPools/joinPoolListModel.dart';
import 'package:Jamiie/src/providers/userJoinedPools/joinPoolProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/widgets/userJoinedPools/joinPoolListWidget.dart';
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

   final List<MembersList> membersList =[
      MembersList(
        url: "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
        name: "ABC"
      )
    ];

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
      body: SingleChildScrollView(
              child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: BaseStyles.topPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              topHeading(title: "My Pool's"),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(itemBuilder: (context, index) {
                  return JoinPoolListWidget(
                    "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb",
                    "ABC",
                    1000,
                    "Weekly",
                    10000,
                    2000,
                    membersList,
                  );

                },
                itemCount: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
