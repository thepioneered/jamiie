import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoaderDialog {
  static Future<bool> _willPopCallback() async {
    return Future.value(false);
  }

  static Future<Null> loaderDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () => _willPopCallback(),
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Container(
              width: 120.0,
              height: 120.0,
              child: Lottie.asset("assets/loader.json"),
            ),
          ),
        ),
      ),
    );

    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (_) {
    //     return Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 125.0),
    //       child: AlertDialog(
    //         backgroundColor: Colors.transparent.withOpacity(0.0),
    //         insetPadding: EdgeInsets.zero,
    //         actionsPadding: EdgeInsets.zero,
    //         buttonPadding: EdgeInsets.zero,
    //         titlePadding: EdgeInsets.zero,
    //         contentPadding: EdgeInsets.zero,
    //         content: Builder(
    //           builder: (ctx) {
    //             return Container(
    //               color: Colors.transparent.withOpacity(0.0),
    //               padding: EdgeInsets.only(bottom: 20.0),
    //               height: 100.0,
    //               width: 100.0,
    //               child: Lottie.asset("assets/loader.json"),
    //             );
    //           },
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
