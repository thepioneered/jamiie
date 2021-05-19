class SocialLoginProviderLogin {
}

class SocialSignup {
  Map<String, dynamic> toJson(
          String _mobile, String _email, String _name) =>
      {
        "phone": _mobile,
        "email": _email,
        "name": _name,
      };
}
