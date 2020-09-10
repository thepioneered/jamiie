import 'package:Jamiie/src/models/adminPoolModel/chooseRoundModel.dart';
import 'package:Jamiie/src/models/adminPoolModel/completePoolDataModel.dart';
import 'package:Jamiie/src/models/base/pageModel.dart';
import 'package:flutter/material.dart';

class ChooseRoundProvider extends ChangeNotifier {
  final chooseRoundScaffoldKey = GlobalKey<ScaffoldState>();
  final chooseRoundModel = ChooseRoundModel();
  final pageModel = PageModel();
  final List<ChooseRoundMemberDetails> a = List<ChooseRoundMemberDetails>();

  void startPoolButton(List<MemberModel> memberModel) {
    for (int i = 0; i < memberModel.length; i++) {
      // final data = ChooseRoundMemberDetails(
      //   phone: memberModel[i].memberDetails.phone,
      //   sequence: i.toString(),
      // );
      a.add(ChooseRoundMemberDetails(
        phone: memberModel[i].memberDetails.phone,
        sequence: i.toString(),
      ));
    }
    print(a);

    print(chooseRoundModel.toJson("aaaaa", a));

    
  }
}
