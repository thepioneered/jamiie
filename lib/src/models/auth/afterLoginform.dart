class AfterLoginFormModel {
  String jobAge;
  String faimlyStatus;
  String howManyTimesPooledMoney;
  String moneySavingGoal;

  AfterLoginFormModel({
    this.jobAge,
    this.faimlyStatus,
    this.howManyTimesPooledMoney,
    this.moneySavingGoal
  });

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "jobAge": jobAge,
        "family":faimlyStatus,
        "poolingRecord":howManyTimesPooledMoney,
        "savingReason":moneySavingGoal

      };
}
