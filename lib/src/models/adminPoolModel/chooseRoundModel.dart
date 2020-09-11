class ChooseRoundModel {

    List<Map<String, dynamic>> list = List<Map<String,dynamic>>();
  Map<String, dynamic> toJson(
      String poolId, List<ChooseRoundMemberDetails> chooseMemberDetails) {
    chooseMemberDetails.forEach((element) {
      list.add(element.toJson());
    });
    return {"poolId": poolId, "sequenceDetail": list};
  }
}

class ChooseRoundMemberDetails {
  final String phone;
  final String sequence;

  ChooseRoundMemberDetails({
    this.phone,
    this.sequence,
  });

  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "sequence": sequence,
    };
  }
}
