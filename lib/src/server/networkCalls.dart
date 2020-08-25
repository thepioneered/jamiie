import 'dart:convert';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'endpoint.dart';
import 'statusCode.dart';
import '../styles/colors.dart';
import '../utils/snackBar.dart';

class NetworkCalls {
  static Future<Map<String, dynamic>> postDataToServer(
      {@required GlobalKey<ScaffoldState> key,
      @required String endPoint,
      @required Function afterRequest,
      bool authRequest = false,
      @required Object body}) async {
        print(body);
        print(EndPoints.ipAddress + endPoint);
    if (await DataConnectionChecker().hasConnection) {
      try {
        var request = await http
            .post(
              EndPoints.ipAddress + endPoint,
              headers: authRequest
                  ? EndPoints.authHeader(await LocalStorage.getToken())
                  : EndPoints.header,
              body: json.encode(body),
            )
            .timeout(
              Duration(seconds: 10),
            );

        return dataHandler(request, key);
      } catch (e) {
        return serverError(e.toString(), key);
      }
    } else {
      return noInternetHandler(key);
    }
  }

  static Map<String, dynamic> serverError(
      String e, GlobalKey<ScaffoldState> key) {
    print("Error in file Network Calls catch $e");
    Navigator.pop(key.currentContext);
    key.currentState.showSnackBar(
      AppSnackBar.snackBar(
          title: "Error occured. Server not responding.",
          backgroundColor: AppColors.red),
    );
    return {"status": false};
  }

  static Map<String, dynamic> noInternetHandler(GlobalKey<ScaffoldState> key) {
    Navigator.pop(key.currentContext);
    key.currentState.showSnackBar(
      AppSnackBar.snackBar(
        title: "No internet. Please check your connection.",
        backgroundColor: AppColors.red,
      ),
    );
    return {"status": false};
  }

  static Map<String, dynamic> dataHandler(
      http.Response request, GlobalKey<ScaffoldState> key) {
    if (request.statusCode == 200) {
      return {"status": true, "body": json.decode(request.body)};
    } else if (request.statusCode == 201) {
      return {"status": true};
    } else {
      Map<String,dynamic> q = json.decode(request.body);
      Navigator.pop(key.currentContext);
      StatusCodeCheck.checkStatusCode(
        request.statusCode,
        key,
        q["response"] == null
            ? "Error in ${request.statusCode}"
            : q["response"],
      );
      return {"status": false};
    }
  }

  static Future<Map<String, dynamic>> getDataFromServer({
    @required GlobalKey<ScaffoldState> key,
    @required String endPoint,
    bool authRequest = false,
  }) async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        var request = await http
            .get(
              EndPoints.ipAddress + endPoint,
              headers: authRequest
                  ? EndPoints.authHeader(await LocalStorage.getToken())
                  : EndPoints.header,
            )
            .timeout(
              Duration(seconds: 10),
            );
        return dataHandler(request, key);
      } catch (e) {
        return serverError(e, key);
      }
    } else {
      return noInternetHandler(key);
    }
  }

  static Future<Map<String, dynamic>> putDataToServer({
    @required GlobalKey<ScaffoldState> key,
    @required String endPoint,
    @required Object body,
    bool authRequest = false,
  }) async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        var request = await http
            .put(
              EndPoints.ipAddress + endPoint,
              headers: authRequest
                  ? EndPoints.authHeader(await LocalStorage.getToken())
                  : EndPoints.header,
              body: json.encode(body),
            )
            .timeout(
              Duration(seconds: 10),
            );

        return dataHandler(request, key);
      } catch (e) {
        return serverError(e, key);
      }
    } else {
      return noInternetHandler(key);
    }
  }
}
