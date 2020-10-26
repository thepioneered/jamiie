import 'package:Jamiie/src/styles/base.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/styles/text.dart';
import 'package:Jamiie/src/widgets/appTextFields/appTextField.dart';
import 'package:Jamiie/src/widgets/button/appButton.dart';
import 'package:Jamiie/src/widgets/topHeading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 411, height: 683, allowFontScaling: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: 1.wp,
            //   decoration: BoxDecoration(
            //     // borderRadius: BorderRadius.circular(2  0),
            //     color: AppColors.primaryColorPurple,
            //   ),
            //   child: Padding(
            //     padding:
            //         EdgeInsets.symmetric(horizontal: 25.0.h, vertical: 15.0.h),
            //     child: Text(
            //       'Payment',
            //       style: TextStyle(
            //         fontFamily: "Poppins",
            //         fontWeight: FontWeight.w500,
            //         color: AppColors.white,
            //         fontSize: 30.sp,
            //       ),
            //     ),
            //   ),
            // ),
            
            
            Container(
              width: 1.wp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Payout to:',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    'Pool 1',
                    style: TextStyle(
                      fontFamily: 'poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Amount :',
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18.0,
                          color: AppColors.grayInputHeading,
                        ),
                      ),
                      AppTextField.screenTextField(
                        hintText: 'Amount',
                        validator: null,
                        autoValidate: false,
                        onSaved: null,
                        prefixIcon: FontAwesomeIcons.dollarSign,
                      ),
                    ],
                  ),
                  
                ],
              ),
            ),
            RaisedButton(
                    onPressed: () {},
                    color: AppColors.primaryColorPurple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          "Send",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18.0.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
