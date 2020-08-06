import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jamiee_flutter/src/server/endpoint.dart';
import 'package:jamiee_flutter/src/server/statusCode.dart';
import 'package:jamiee_flutter/src/styles/colors.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class NetworkCalls {
  static bool status;

  static Future<Map<String, dynamic>> postDataToServer(
      {@required GlobalKey<ScaffoldState> key,
      @required String endPoint,
      @required Function afterRequest,
      @required Object body}) async {
    status = await DataConnectionChecker().hasConnection;
    if (status == true) {
      try {
        var request = await http.post(EndPoints.ipAddress + endPoint,
            headers: EndPoints.header, body: json.encode(body));
        print(request.statusCode);

        if (request.statusCode != 200) {
          StatusCodeCheck.checkStatusCode(request.statusCode, key);
          return {"status": false};
        } else {
          return {"status": true, "body": json.decode(request.body)};
        }
      } catch (e) {
        print("Error in file Network Calls catch $e");
        return {"status": false};
      }
    } else {
      print("Error here");
      key.currentState.showSnackBar(StatusCodeCheck.snackBar(
          title: "No internet.Please check your connection.",
          backgroundColor: AppColors.red));
      return {"status": false};
    }
    // try {
    //   await http
    //       .get(EndPoints.toCheckInternet, headers: EndPoints.header)
    //       .timeout(Duration(seconds: 3))
    //       .then((value) {
    //     if (value.statusCode == 200) {
    //       status = true;
    //     }
    //   });
    // } catch (e) {
    //   // print("Error here");
    //   // key.currentState.showSnackBar(StatusCodeCheck.snackBar(
    //   //     title: "No internet.Please check your connection.",
    //   //     backgroundColor: AppColors.red));
    //   // return {"status": false};
    // } finally {
    // if (status == true) {
    // try {
    //   var request = await http.post(EndPoints.ipAddress + endPoint,
    //       headers: EndPoints.header, body: json.encode(body));
    //   print(request.statusCode);

    //   if (request.statusCode != 200) {
    //     StatusCodeCheck.checkStatusCode(request.statusCode, key);
    //     return {"status": false};
    //   } else {
    //     return {"status": true, "body": json.decode(request.body)};
    //   }
    // } catch (e) {
    //   print("Error in file Network Calls catch $e");
    //   return {"status": false};
    // }
    // }
    // }
  }
}
