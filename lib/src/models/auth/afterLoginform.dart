class AfterLoginFormModel {
  String jobAge;
  String faimlyStatus;
  String howManyTimesPooledMoney;

  AfterLoginFormModel({
    this.jobAge,
    this.faimlyStatus,
    this.howManyTimesPooledMoney,
  });

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "jobAge": jobAge,
        "family":faimlyStatus,
        "poolingRecord":howManyTimesPooledMoney

      };
}
