import 'package:Jamiie/src/models/userJoinedPools/joinPoolListModel.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JoinPoolListWidget extends StatelessWidget {
  JoinPoolListWidget(
    this.imgUrl,
    this.poolName,
    this.poolAmount,
    this.poolType,
    this.monthlyTotalAmount,
    this.amountSaved,
    this.membersList,
  );

  final String imgUrl;
  final String poolName;
  final int poolAmount;
  final String poolType;
  final int monthlyTotalAmount;
  final int amountSaved;
  final List<MembersList> membersList;

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height * .45,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColorPurple,
                backgroundImage: new NetworkImage(imgUrl),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  poolName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                ),
              ),
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
                      poolAmount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      poolType + " per person",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    monthlyTotalAmount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Monthly Total",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    amountSaved.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Money Saved",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contributors",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

                Container(
                  height: 50.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    //padding: EdgeInsets.symmetric(horizontal: 2),

                    itemCount: membersList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              new NetworkImage(membersList[index].url),
                        ),
                      );
                    },
                  ),
                )

                // })
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(FontAwesomeIcons.ellipsisH),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
      ),
    );
  }
}
