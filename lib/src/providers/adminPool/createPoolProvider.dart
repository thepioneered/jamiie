import 'package:Jamiie/src/widgets/loaderDialog.dart';

import '../../widgets/sucessCreatePool.dart';
import '../../models/createPoolModels/poolidModel.dart';
import '../../models/base/pageModel.dart';
import '../../server/endpoint.dart';
import '../../server/networkCalls.dart';
import '../../styles/colors.dart';
import '../../utils/sharedPref.dart';
import '../../utils/snackBar.dart';
import 'package:flutter/material.dart';
import '../../models/createPoolModels/createPoolModel.dart';

class CreatePoolProvider with ChangeNotifier {
  final createPoolFormKey = GlobalKey<FormState>();
  final createPoolScaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate;
  TextEditingController date = TextEditingController();
  CreatePoolModel createPool;
  PageModel pageModel;

  CreatePoolProvider() {
    createPool = CreatePoolModel();
    selectedDate = DateTime.now();
    pageModel = PageModel();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date.value =
          TextEditingValue(text: selectedDate.toString().substring(0, 10));
    }
  }

  void createPoolLogic() async {
    pageModel.onceFormSubmitted = true;
    notifyListeners();
    if (createPoolFormKey.currentState.validate()) {
      createPoolFormKey.currentState.save();
      try {
        LoaderDialog.loaderDialog(createPoolScaffoldKey.currentContext);
      } catch (e) {
        throw Exception(e);
      }
      createPool.deadline = selectedDate.toString().substring(0, 10);
      print(
        createPool.toJson(
          await LocalStorage.getMobile(),
        ),
      );
      Map<String, dynamic> body = await NetworkCalls.postDataToServer(
        shouldPagePop: true,
        key: createPoolScaffoldKey,
        endPoint: EndPoints.createPool,
        authRequest: true,
        afterRequest: () {},
        body: createPool.toJson(
          await LocalStorage.getMobile(),
        ),
      );
      if (body["status"]) {
        Navigator.pop(createPoolScaffoldKey.currentContext);
        pageModel.onceFormSubmitted = false;
        date.clear();
        createPoolFormKey.currentState.reset();
        notifyListeners();
        PoolIdModel poolId = PoolIdModel.fromJson(body["body"]);
        print(poolId.poolId);
        AppBottomModalSheet.bottomSheetSucess(
            createPoolScaffoldKey.currentContext, poolId.poolId);
      } else {
        AppSnackBar.snackBar(
            title: "Pool not Created", backgroundColor: AppColors.red);
      }
    }
  }
}
