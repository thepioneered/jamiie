class UserName {
  String name;
  UserName({this.name='Mark'});
}

class PoolNumbers {

  int totalAmount;
  int createdPools;
  int joinedPools;
  int completedPools;

  PoolNumbers({
    this.completedPools=23,
    this.joinedPools=12,
    this.createdPools=9,
    this.totalAmount=1000,
  });
}
