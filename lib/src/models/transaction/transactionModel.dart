class TransactionModel {
  
  String amount;

  TransactionModel({
    this.amount,
  });

  Map<String, dynamic> toJson(String _mobile,String poolId) => {
        "phone": _mobile,
        "poolId": poolId,
        "amount": amount,
      };
}
