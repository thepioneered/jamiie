class ChooseRoundModel {
  // List<ChooseRoundMemberDetails> chooseRoundMemberDetails;

  // ChooseRoundModel(){
  //   chooseRoundMemberDetails =  List<ChooseRoundMemberDetails>();
  // }
  Map<String, dynamic> toJson(
      String poolId, List<ChooseRoundMemberDetails> chooseMemberDetails) {
    // chooseMemberDetails.forEach((element) );
    // return {"poolId": poolId, "sequenceDetail": };
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
    return {"phone": phone, "sequence": sequence};
  }
}
