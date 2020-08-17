import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/utils/textConst.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';

import 'button/appButton.dart';

class SuccesCreatePoolBottomSheet{

  static void bottomSheet(BuildContext ctx,String _poolId){
     showModalBottomSheet(
            context: ctx,
            builder: (ctx) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Lottie.asset('assets/money.json'),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 10.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Congratulation's!\n",
                                style: AppTextStyle.createPoolBottom),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Pool ID: ",
                                style: AppTextStyle.subheadingText),
                            TextSpan(
                                text: _poolId,
                                style: AppTextStyle.poolID),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: AppButton.loginButton(
                        loader: false,
                        onTap: () {
                          Share.share(
                            AppConstString.sharePoolId(
                              _poolId,
                            ),
                          );
                        },
                        title: AppConstString.sharePooltitle,
                      ),
                    )
                  ],
                ),
              );
            });

  }
}