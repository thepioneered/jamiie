import 'package:Jamiie/src/models/userJoinedPools/joinPoolListModel.dart';
import 'package:Jamiie/src/screens/userJoinedPools/joinPoolScreen.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:flutter/material.dart';

class JoinPoolListWidget extends StatelessWidget {
  JoinPoolListWidget({
    this.imgUrl,
    this.poolName,
    this.poolAmount,
    this.poolType,
    this.monthlyTotalAmount,
    this.amountSaved,
    this.membersList,
    this.status,
  });

  final String imgUrl;
  final String poolName;
  final int poolAmount;
  final String poolType;
  final int monthlyTotalAmount;
  final int amountSaved;
  final List<MembersList> membersList;
  final bool status;

  @override
  Widget build(BuildContext context) {
    if (status == true) {
      return Container(
        margin: EdgeInsets.only(bottom: 15.0),
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(15.0),
        height: MediaQuery.of(context).size.height * .4,
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
                Container(
                  padding: EdgeInsets.only(
                      left: 7.5, right: 7.5, top: 3.0, bottom: 3.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    "Pending",
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "poppins",
                    ),
                  ),
                )
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
                        "\$ " + poolAmount.toString(),
                        style: AppTextStyle.amountStyle,
                      ),
                      Text(
                        poolType + " per person",
                        style: AppTextStyle.amountSubHeading,
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
                      "\$ " + monthlyTotalAmount.toString(),
                      style: AppTextStyle.poolMonthlyTotalAmount
                    ),
                    Text("Monthly Total", style: AppTextStyle.amountSubHeading),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$ " + amountSaved.toString(),
                      style: AppTextStyle.poolAmountSaved,
                      
                    ),
                    Text("Money Saved", style: AppTextStyle.amountSubHeading),
                  ],
                ),
              ],
            ),
            // Container(
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Text(
            //         "Contributors",
            //         style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //           fontSize: 16.0,
            //         ),
            //       ),
            //       SizedBox(
            //         height: 10.0,
            //       ),

            // //       Container(
            // //         height: 50.0,
            // //         child: ListView.builder(
            // //           scrollDirection: Axis.horizontal,
            // //           //padding: EdgeInsets.symmetric(horizontal: 2),

            // //           itemCount: membersList.length,
            // //           itemBuilder: (context, index) {
            // //             return Padding(
            // //               padding: EdgeInsets.symmetric(horizontal: 6.0),
            // //               child: CircleAvatar(
            // //                 backgroundColor: Colors.grey,
            // //                 backgroundImage:
            // //                     new NetworkImage(membersList[index].url),
            // //               ),
            // //             );
            // //           },
            // //         ),
            // //       )

            // //       // })
            // //     ],
            // //   ),
            // // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Icon(FontAwesomeIcons.ellipsisH),
            //   ],
            // )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white,
          boxShadow: [
            // BoxShadow(
            //   color: Colors.grey,
            //   //offset: Offset(0, 0),
            //  // blurRadius: 6.0,
            // ),
          ],
        ),
      );
    } else {
      return GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => PoolScreen()));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 15.0),
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          height: MediaQuery.of(context).size.height * .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // CircleAvatar(
                  //   backgroundColor: AppColors.primaryColorPurple,
                  //   backgroundImage: new NetworkImage(imgUrl),
                  // ),
                  Text(
                    poolName,
                    style: AppTextStyle.poolTitle,
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
                        Text("\$ " + poolAmount.toString(),
                            style: AppTextStyle.amountStyle),
                        Text(poolType + " per person",
                            style: AppTextStyle.amountSubHeading),
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
                        "\$ " + monthlyTotalAmount.toString(),
                        style: AppTextStyle.poolMonthlyTotalAmount
                      ),
                      Text("Monthly Total",
                          style: AppTextStyle.amountSubHeading),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ " + amountSaved.toString(),
                        style: AppTextStyle.poolAmountSaved
                      ),
                      Text("Money Saved", style: AppTextStyle.amountSubHeading),
                    ],
                  ),
                ],
              ),
              // Container(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Contributors",
              //         style: TextStyle(
              //           fontWeight: FontWeight.w400,
              //           fontSize: 16.0,
              //         ),
              //       ),
              //       SizedBox(
              //         height: 10.0,
              //       ),

              //       Container(
              //         height: 50.0,
              //         child: ListView.builder(
              //           scrollDirection: Axis.horizontal,
              //           //padding: EdgeInsets.symmetric(horizontal: 2),

              //           itemCount: membersList.length,
              //           itemBuilder: (context, index) {
              //             return Padding(
              //               padding: EdgeInsets.symmetric(horizontal: 6.0),
              //               child: CircleAvatar(
              //                 backgroundColor: Colors.grey,
              //                 backgroundImage:
              //                     new NetworkImage(membersList[index].url),
              //               ),
              //             );
              //           },
              //         ),
              //       )

              //       // })
              //     ],
              //   ),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Icon(FontAwesomeIcons.ellipsisH),
              //   ],
              // )
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white,
            boxShadow: [
              // BoxShadow(
              //   color: Colors.grey,
              //   //offset: Offset(0, 0),
              //  // blurRadius: 6.0,
              // ),
            ],
          ),
        ),
      );
    }
  }
}
