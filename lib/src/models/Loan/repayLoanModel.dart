class RepayLoanModel {
  int amount;
  String transactionUrl;
  String message;

  RepayLoanModel({
    this.amount,
    this.message,
    this.transactionUrl,
  });

  RepayLoanModel.fromJson(Map<String, dynamic> data)
      : amount = data["amount"],
        transactionUrl = data["transaction_url"],
        message = data["message"];
}
