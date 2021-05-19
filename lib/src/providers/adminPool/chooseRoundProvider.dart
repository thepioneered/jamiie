import 'package:Jamiie/src/models/adminPoolModel/chooseRoundModel.dart';
import 'package:Jamiie/src/models/adminPoolModel/completePoolDataModel.dart';
import 'package:Jamiie/src/models/base/pageModel.dart';
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
    for (int i = 0; i < memberModel.length/2; i++) {
      print(i);
      a.add(ChooseRoundMemberDetails(
        phone: memberModel[i].memberDetails.phone,
        sequence: i.toString(),
      ));
    }
  }
}
