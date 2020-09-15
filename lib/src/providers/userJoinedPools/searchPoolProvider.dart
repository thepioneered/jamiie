import '../../models/base/pageModel.dart';
import '../../models/userJoinedPools/joinPoolModel.dart';
import '../../models/userJoinedPools/poolModel.dart';
import '../../models/userJoinedPools/searchPoolModel.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../styles/colors.dart';
import '../../utils/sharedPref.dart';
import '../../utils/snackBar.dart';
import '../../widgets/loaderDialog.dart';
import '../../widgets/sucessCreatePool.dart';
import 'package:flutter/material.dart';

class SearchPoolProvider with ChangeNotifier {
  GlobalKey<ScaffoldState> searchPoolPageScaffoldKey =
      GlobalKey<ScaffoldState>();
  GlobalKey<FormState> searchPoolPageFormKey = GlobalKey<FormState>();

  SearchPoolIdModel poolIdModel;
  final pageModel = PageModel();

  SearchPoolProvider() {
    poolIdModel = SearchPoolIdModel();
  }

  void searchPoolLogic() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (searchPoolPageFormKey.currentState.validate()) {
      searchPoolPageFormKey.currentState.save();

      try {
        LoaderDialog.loaderDialog(searchPoolPageScaffoldKey.currentContext);
      } catch (e) {
        throw Exception(e);
      }
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        shouldPagePop: true,
        key: searchPoolPageScaffoldKey,
        endPoint: EndPoints.searchPool,
        afterRequest: () {},
        authRequest: true,
        body: poolIdModel.toJson(),
      );

      if (body["status"]) {
        Navigator.pop(searchPoolPageScaffoldKey.currentContext);
        pageModel.onceFormSubmitted = false;
        searchPoolPageFormKey.currentState.reset();
        notifyListeners();
        final showPoolModel = ShowPoolModel.fromJson(
          body["body"],
        );
        final joinPoolModel = JoinPoolIdModel();
        joinPoolModel.poolId = showPoolModel.poolid;
        print(showPoolModel.poolowner);
        print(showPoolModel.poolname);

        //Bottom Dialog For Join Pool
        AppBottomModalSheet.bottomSheetJoinPool(
          searchPoolPageScaffoldKey.currentContext,
          showPoolModel,
          () async {
            Navigator.pop(searchPoolPageScaffoldKey.currentContext);
            try {
              LoaderDialog.loaderDialog(
                  searchPoolPageScaffoldKey.currentContext);
            } catch (e) {
              throw Exception(e);
            }
            Map<String, dynamic> body = await NetworkCalls.postDataToServer(
              shouldPagePop: true,
              key: searchPoolPageScaffoldKey,
              endPoint: EndPoints.joinPool,
              afterRequest: () {},
              authRequest: true,
              body: joinPoolModel.toJson(
                await LocalStorage.getMobile(),
              ),
            );
            if (body["status"]) {
              Navigator.pop(searchPoolPageScaffoldKey.currentContext);
              searchPoolPageScaffoldKey.currentState.showSnackBar(
                AppSnackBar.snackBar(
                    title: "Pool Joined.", backgroundColor: AppColors.green),
              );
            }
          },
        );
      }
    }
  }
}
