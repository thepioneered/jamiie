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

        if (request.statusCode != 200) {
          Navigator.pop(key.currentContext);
          StatusCodeCheck.checkStatusCode(
            request.statusCode,
            key,
            request.body.isEmpty ? null : json.decode(request.body),
          );
          return {"status": false};
        } else {
          if (request.body.isEmpty) {
            return {"status": true};
          } else {
            return {"status": true, "body": json.decode(request.body)};
          }
        }
      } catch (e) {
        print("Error in file Network Calls catch $e");
        Navigator.pop(key.currentContext);
        key.currentState.showSnackBar(
          AppSnackBar.snackBar(
              title: "Error occured. Server not responding.",
              backgroundColor: AppColors.red),
        );
        return {"status": false};
      }
    } else {
      print("Error here");
      Navigator.pop(key.currentContext);
      key.currentState.showSnackBar(
        AppSnackBar.snackBar(
          title: "No internet. Please check your connection.",
          backgroundColor: AppColors.red,
        ),
      );
      return {"status": false};
    }
  }

  static Future<Map<String, dynamic>> getDataFromServer({
    @required GlobalKey<ScaffoldState> key,
    @required String endPoint,
  }) async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        var request = await http.get(EndPoints.ipAddress + endPoint,
            headers: EndPoints.header);

        if (request.statusCode != 200) {
          Navigator.pop(key.currentContext);
          StatusCodeCheck.checkStatusCode(
            request.statusCode,
            key,
            request.body.isEmpty ? null : json.decode(request.body),
          );
          return {"status": false};
        } else {
          if (request.body.isEmpty) {
            return {"status": true};
          } else {
            return {"status": true, "body": json.decode(request.body)};
          }
        }
      } catch (e) {
        Navigator.pop(key.currentContext);
        print("Error in file Network Calls catch $e");
        return {"status": false};
      }
    } else {
      Navigator.pop(key.currentContext);
      key.currentState.showSnackBar(AppSnackBar.snackBar(
          title: "No internet.Please check your connection.",
          backgroundColor: AppColors.red));
      return {"status": false};
    }
  }

  static Future<Map<String, dynamic>> putDataToServer({
    @required GlobalKey<ScaffoldState> key,
    @required String endPoint,
    @required Object body,
  }) async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        var request = await http.put(EndPoints.ipAddress + endPoint,
            headers: EndPoints.header, body: json.encode(body));

        if (request.statusCode != 200) {
          Navigator.pop(key.currentContext);
          StatusCodeCheck.checkStatusCode(
            request.statusCode,
            key,
            request.body.isEmpty ? null : json.decode(request.body),
          );
          return {"status": false};
        } else {
          if (request.body.isEmpty) {
            return {"status": true};
          } else {
            return {"status": true, "body": json.decode(request.body)};
          }
        }
      } catch (e) {
        Navigator.pop(key.currentContext);
        print("Error in file Network Calls catch $e");
        return {"status": false};
      }
    } else {
      Navigator.pop(key.currentContext);
      key.currentState.showSnackBar(AppSnackBar.snackBar(
          title: "No internet.Please check your connection.",
          backgroundColor: AppColors.red));
      return {"status": false};
    }
  }
}
