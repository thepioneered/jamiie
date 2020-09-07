import 'package:Jamiie/src/models/Dashboard/dashCardModel.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../styles/text.dart';

class DashWidget3 extends StatelessWidget {

  DashWidget3(this.upcomingPaymentList);
  final List<UpcomingPayments> upcomingPaymentList; 
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Payments',
            style: AppTextStyle.dashCardHeading,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight:height * .34 
            ),
      padding: EdgeInsets.only(top: 5),
      
      child: NotificationListener(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView.builder(
          controller: ScrollController(
            initialScrollOffset: 0,
            keepScrollOffset: false,
          ),
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (context, index) {
            return Container(
              height: height * .32 / 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        upcomingPaymentList[index].name,
                        style: AppTextStyle.dashCardText(Colors.black),
                      ),
                      AutoSizeText(
                        '+\$${upcomingPaymentList[index].amount}',
                        style: AppTextStyle.dashTransAmount,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        upcomingPaymentList[index].date,
                        style: AppTextStyle.dashCardHint,
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: upcomingPaymentList.length,
        ),
      ),
    ),
        ],
      ),
    );
  }
}

