import 'package:Jamiie/src/models/userJoinedPools/poolModel.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/repositry/textConst.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share/share.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'button/appButton.dart';

class AppBottomModalSheet {
  static Future<bool> _willPopCallback() async {
    return Future.value(false);
  }

  static Widget dataContainer(String title, String data) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title :',
            style: AppTextStyle.joinPoolHeading,
          ),
          SizedBox(
            height: 3.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 15.0,
              ),
              Text(data, style: AppTextStyle.joinPoolSubHeading),
            ],
          ),
        ],
      ),
    );
  }

  static void bottomSheetJoinPool(
      BuildContext ctx, ShowPoolModel _showPoolModel, Function onTap) {
    showModalBottomSheet(
      isDismissible: false,
      enableDrag: false,
      context: ctx,
      builder: (ctx) {
        return WillPopScope(
          onWillPop: () => _willPopCallback(),
          child: Container(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 15.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: (MediaQuery.of(ctx).size.width - 30.0) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                dataContainer("Pool ID", _showPoolModel.poolid),
                                dataContainer(
                                    "Pool Name", _showPoolModel.poolname),
                                dataContainer("Pool Amount",
                                    _showPoolModel.poolamount.toString()),
                                dataContainer("Deadline to join pool",
                                    _showPoolModel.deadline),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(ctx).size.width - 30.0) / 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                dataContainer(
                                  "Pool Member's",
                                  '${_showPoolModel.joinedmember.toString()}/${_showPoolModel.maxmember.toString()}',
                                ),
                                dataContainer(
                                    "Pool Owner", _showPoolModel.poolowner),
                              ],
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                        height: MediaQuery.of(ctx).size.height * 0.07,
                        child: AppButton.loginButton(
                          onTap: onTap,
                          title: "Join Pool",
                        ),
                      )
                    ],
                  ),
                ),
                backIcon(ctx),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget backIcon(BuildContext ctx) {
    return Positioned(
      top: 7.5,
      right: 7.5,
      child: IconButton(
        splashRadius: 30.0,
        icon: Icon(
          Icons.cancel,
          color: AppColors.primaryColorPurple,
          size: 24.0,
        ),
        onPressed: () {
          Navigator.pop(ctx);
        },
      ),
    );
  }

  static void bottomSheetSucess(BuildContext ctx, String _poolId) {
    showModalBottomSheet(
        context: ctx,
        builder: (ctxx) {
          return SizedBox(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
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
                                  text: _poolId, style: AppTextStyle.poolID),
                            ],
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 75.h,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 15.0),
                        child: AppButton.loginButton(
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
                ),
                backIcon(ctx)
              ],
            ),
          );
        });
  }
}
