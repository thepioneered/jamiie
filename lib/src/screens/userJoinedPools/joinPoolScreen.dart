import 'package:Jamiie/src/providers/userJoinedPools/joinPoolScreenProvider.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/widgets/appBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JoinPoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => JoinPoolScreenProvider(),
      child: JoinPoolScreenWidget(),
    );
  }
}

class JoinPoolScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var joinPoolScreenProvider = Provider.of<JoinPoolScreenProvider>(context);
    return Scaffold(
      key: joinPoolScreenProvider.joinPoolScreenScaffoldKey,
      appBar: AppBarWidget.getAppBar(context, '', isRegistration: false),
      backgroundColor: AppColors.white,
      body: FutureBuilder(
        future: joinPoolScreenProvider.loadPageAsset(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            var data = joinPoolScreenProvider.joinPoolScreenModel;
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .8,
                      child: ListView.builder(
                          itemCount: data.members.length,
                          itemBuilder: (context, index) => Column(
                                children: [
                                  Divider(
                                    height: 10,
                                  ),
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor:
                                          AppColors.primaryColorPurple,
                                      backgroundImage: NetworkImage(data
                                          .members[index]
                                          .memberDetails
                                          .imageURL),
                                    ),
                                    title: Text(
                                      data.members[index].memberDetails.name,
                                      style: TextStyle(fontFamily: "poppins"),
                                    ),
                                  ),
                                ],
                              )),
                    )
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
