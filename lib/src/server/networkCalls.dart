import 'dart:convert';
import 'dart:io';
import 'package:Jamiie/src/utils/sharedPref.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:http_parser/http_parser.dart';
import 'endpoint.dart';
import 'statusCode.dart';
import '../styles/colors.dart';
import '../utils/snackBar.dart';

class NetworkCalls {
  static Future<Map<String, dynamic>> postDataToServer(
      {@required GlobalKey<ScaffoldState> key,
      @required String endPoint,
      @required Function afterRequest,
      @required bool shouldPagePop,
      bool authRequest = false,
      bool showSnackBar = true,
      @required Object body}) async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        print(body);
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
        return dataHandler(request, key, shouldPagePop, showSnackBar);
      } catch (e) {
        return serverError(e.toString(), key, shouldPagePop);
      }
    } else {
      return noInternetHandler(key, shouldPagePop);
    }
  }

  static Map<String, dynamic> serverError(
      String e, GlobalKey<ScaffoldState> key, bool pop) {
    print("Error in file Network Calls catch $e");
    if (pop) {
      Navigator.pop(key.currentContext);
    }
    key.currentState.showSnackBar(
      AppSnackBar.snackBar(
          title: "Error occured. Server not responding.",
          backgroundColor: AppColors.red),
    );
    return {"status": false};
  }

  static Map<String, dynamic> noInternetHandler(
      GlobalKey<ScaffoldState> key, bool pop) {
    if (pop) {
      Navigator.pop(key.currentContext);
    }

    key.currentState.showSnackBar(
      AppSnackBar.snackBar(
        title: "No internet. Please check your connection.",
        backgroundColor: AppColors.red,
      ),
    );
    return {"status": false};
  }

  static Map<String, dynamic> dataHandler(
      http.Response request,
      final GlobalKey<ScaffoldState> key,
      final bool pop,
      final bool showSnackBar) {
    print(request.statusCode);
    print(request.body);
    if (request.statusCode == 200) {
      return {"status": true, "body": json.decode(request.body)};
    } else if (request.statusCode == 201) {
      return {"status": true};
    } else {
      Map<String, dynamic> q = json.decode(request.body);
      if (pop) {
        Navigator.pop(key.currentContext);
      }
      if (showSnackBar)
        StatusCodeCheck.checkStatusCode(
          request.statusCode,
          key,
          q["response"] == null
              ? "Error in ${request.statusCode}"
              : q["response"],
        );
      return q["response"] == null
          ? {"status": false}
          : {"status": false, "response": q["response"]};
    }
  }

  static Future<Map<String, dynamic>> getDataFromServer({
    @required GlobalKey<ScaffoldState> key,
    @required String endPoint,
    bool authRequest = false,
    @required shouldPagePop,
    bool showSnackBar = true,
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
        return dataHandler(request, key, shouldPagePop, showSnackBar);
      } catch (e) {
        return serverError(e, key, shouldPagePop);
      }
    } else {
      return noInternetHandler(key, shouldPagePop);
    }
  }

  static Future<Map<String, dynamic>> multiPartRequest(
      {@required GlobalKey<ScaffoldState> key,
      @required String endPoint,
      @required shouldPagePop,
      @required Object body,
      @required File savedImage}) async {
    if (await DataConnectionChecker().hasConnection) {
      try {
        Uri postUri = Uri.parse(EndPoints.ipAddress + endPoint);
        var request = http.MultipartRequest("POST", postUri);
        request.headers.addAll(
          EndPoints.authHeader(await LocalStorage.getToken()),
        );
        request.fields.addAll(body);
        request.files.add(
          await http.MultipartFile.fromPath(
            'image',
            savedImage.path,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
        var response = await request.send();
        if (response.statusCode == 201) {
          return {"status": true};
        } else {
          Map<String, dynamic> q = {
            "error": "Error occured",
          };
          Navigator.pop(key.currentContext);
          StatusCodeCheck.checkStatusCode(
            response.statusCode,
            key,
            q["response"] == null
                ? "Error in ${response.statusCode}"
                : q["response"],
          );
          return {"status": false};
        }
      } catch (e) {
        return serverError(e, key, shouldPagePop);
      }
    } else {
      return noInternetHandler(key, shouldPagePop);
    }
  }

  static Future<Map<String, dynamic>> putDataToServer({
    @required GlobalKey<ScaffoldState> key,
    @required String endPoint,
    @required Object body,
    @required shouldPagePop,
    bool authRequest = false,
    bool showSnackBar = true,
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

        return dataHandler(request, key, shouldPagePop, showSnackBar);
      } catch (e) {
        return serverError(e, key, shouldPagePop);
      }
    } else {
      return noInternetHandler(key, shouldPagePop);
    }
  }
}
