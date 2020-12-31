import 'package:Jamiie/src/models/adminPoolModel/chooseRoundModel.dart';
import 'package:Jamiie/src/models/adminPoolModel/completePoolDataModel.dart';
import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:Jamiie/src/server/endpoint.dart';
import 'package:Jamiie/src/server/networkCalls.dart';
import 'package:Jamiie/src/styles/colors.dart';
import 'package:Jamiie/src/utils/snackBar.dart';
import 'package:Jamiie/src/widgets/loaderDialog.dart';
import 'package:flutter/material.dart';

class ChooseRoundProvider extends ChangeNotifier {
  final chooseRoundScaffoldKey = GlobalKey<ScaffoldState>();
  final chooseRoundModel = ChooseRoundModel();
  final pageModel = PageModel();
  final List<ChooseRoundMemberDetails> a = List<ChooseRoundMemberDetails>();

  void startPoolButton(List<MemberModel> memberModel, String poolId) async {
    try {
      LoaderDialog.loaderDialog(chooseRoundScaffoldKey.currentContext);
    } catch (e) {
      throw Exception(e);
    }
    for (int i = 0; i < memberModel.length; i++) {
      a.add(ChooseRoundMemberDetails(
        phone: memberModel[i].memberDetails.phone,
        sequence: i.toString(),
      ));
    }
    //TODO:Iska error dekh bhai

    var b = a;
    print(b);
    print(a[0].sequence);
    print(chooseRoundModel.toJson(poolId, b));

    Map<String, dynamic> data = await NetworkCalls.postDataToServer(
      shouldPagePop: true,
      key: chooseRoundScaffoldKey,
      endPoint: EndPoints.startPool,
      afterRequest: () {},
      authRequest: true,
      body: chooseRoundModel.toJson(poolId, b),
    );
    //TODO
//Isme error hai bhai kl nitish ke sath bthke through testing kro
//TODOWork: is pending here and pop main dikkt aa rhi kuch yhn
    if (data["status"]) {
      Navigator.pop(chooseRoundScaffoldKey.currentContext);
        chooseRoundScaffoldKey.currentState.showSnackBar(AppSnackBar.snackBar(
          title: "Pool Started", backgroundColor: AppColors.green));
    }
  }
}
