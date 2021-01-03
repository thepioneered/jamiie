class LoanModel {
  int amount;
  double interest;

  LoanModel({
    this.amount,
    this.interest,
  });

  LoanModel.fromJson(Map<String, dynamic> data) 
      : amount = data["amount"],
        interest = data["interest"];
}

