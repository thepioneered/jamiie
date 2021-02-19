class Signup {
  String firstName;
  String lastName;
  String email;
  String password;

  Signup({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson(String _mobile) => {
        "phone": _mobile,
        "password": password,
        "email": email,
        "name": '$firstName $lastName',
      };
}
