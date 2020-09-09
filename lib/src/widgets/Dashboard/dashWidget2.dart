import '../../models/Dashboard/dashCardModel.dart';

import 'package:flutter/material.dart';
import '../../styles/text.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DashWidget2 extends StatelessWidget {
  DashWidget2(this.transactionList);
  final List<Transaction> transactionList;

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
            'Transactions',
            style: AppTextStyle.dashCardHeading,
          ),
          Container(
            padding: EdgeInsets.only(top: 5),

            constraints: BoxConstraints(maxHeight: height * .34),
            // child: NotificationListener(
            //   onNotification: (overscroll) {
            //     overscroll.disallowGlow();
            //     return false;
            //   },
            //   child:

            child: ListView.builder(
               reverse: true,
              // addSemanticIndexes: true,
              // controller: ScrollController(
              //   initialScrollOffset: 0,
              //   keepScrollOffset: false,
              // ),
              // shrinkWrap: false,
              padding: EdgeInsets.symmetric(horizontal: 5),

              itemCount: transactionList.length,
              itemBuilder: (context, index) {
                return Container(
                  height: height * .32 / 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            transactionList[index].name,
                            maxLines: 1,
                            style: AppTextStyle.dashCardText(Colors.black),
                          ),
                          AutoSizeText(
                            '+\$${transactionList[index].amount}',
                            style: AppTextStyle.dashTransAmount,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            'Sent',
                            minFontSize: 9,
                            style: AppTextStyle.dashCardHint,
                          ),
                          AutoSizeText(
                            transactionList[index].date,
                            minFontSize: 9,
                            style: AppTextStyle.dashCardHint,
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // )
        ],
      ),
    );
  }
}
