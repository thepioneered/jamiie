import 'package:Jamiie/src/models/adminPoolModel/poolListModel.dart';
import 'package:Jamiie/src/providers/adminPool/adminPoolProvider.dart';
import 'package:Jamiie/src/widgets/appImage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'poolDataPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../styles/text.dart';
import '../../styles/colors.dart';

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
      body: FutureBuilder<PoolListModel>(
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
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 100.0,
                    //   child: Column(
                    //     children: [],
                    //   ),
                    // ),
                    Container(
                      height: 300.0 *
                          createdPoolList.poolListModel.poolDataModel.length,
                      child: ListView.builder(
                        itemCount:
                            createdPoolList.poolListModel.poolDataModel.length,
                        itemBuilder: (context, index) {
                          var data =
                              createdPoolList.poolListModel.poolDataModel;
                          return _data(
                              poolName: data[index].poolName,
                              poolContribution: data[index].contributionAmount);
                        },
                      ),
                    ),
                    // _data(),
                    // _data(),
                    // _data(),
                  ],
                ),
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

  Widget _data({@required String poolName, @required int poolContribution}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PoolDataPage()));
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height / 2.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    poolName,
                    style: AppTextStyle.poolTitle,
                  ),
                  Icon(FontAwesomeIcons.ellipsisV),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\$ ${poolContribution.toString()}",
                          style: AppTextStyle.amountStyle,
                        ),
                        Text("Monthly per person",
                            style: AppTextStyle.amountSubHeading)
                      ],
                    ),
                  ),
                  RaisedButton(
                    color: AppColors.primaryColorPurple,
                    onPressed: () {},
                    child: Icon(
                      Icons.keyboard_arrow_right,
                      color: AppColors.white,
                    ),
                  )
                ],
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pool Members",
                      style: AppTextStyle.inputText,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),

                    Container(
                      height: 50.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 25.0,
                            width: 50.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60.0),
                              child: AppImageWidget.appImageWidget(
                                "http://via.placeholder.com/100x60",
                              ),
                            ),
                          );
                        },
                      ),
                    )

                    // })
                  ],
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
