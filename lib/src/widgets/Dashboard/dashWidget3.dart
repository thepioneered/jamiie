import 'package:Jamiie/src/models/Dashboard/transactionModel.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../styles/text.dart';

class DashWidget3 extends StatelessWidget {

  DashWidget3(this.upcomingPaymentList);
  final List<Transaction> upcomingPaymentList; 
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
      padding: EdgeInsets.only(top: 5),
      height: height * .34,
      child: NotificationListener(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
        },
        child: ListView.builder(
          controller: ScrollController(
            initialScrollOffset: 0,
            keepScrollOffset: false,
          ),
          shrinkWrap: false,
          padding: EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (context, index) {
            return Container(
              height: height * .32 / 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        upcomingPaymentList[index].name,
                        style: AppTextStyle.dashCardText(Colors.black),
                      ),
                      Text(
                        '+\$${upcomingPaymentList[index].amount}',
                        style: AppTextStyle.dashTransAmount,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        DateFormat.yMMMd().format(upcomingPaymentList[index].date),
                        style: AppTextStyle.dashCardHint,
                      )
                    ],
                  ),
                ],
              ),
            );
          },
          itemCount: 5,
        ),
      ),
    ),
        ],
      ),
    );
  }
}

