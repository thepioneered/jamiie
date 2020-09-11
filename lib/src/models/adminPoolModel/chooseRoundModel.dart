class ChooseRoundModel {

  Map<String, dynamic> toJson(
      String poolId, List<ChooseRoundMemberDetails> chooseMemberDetails) {
    List<Map<String, dynamic>> list;
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
