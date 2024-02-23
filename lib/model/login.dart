class Login {
  int code;
  bool status;
  String token;
  int userId;
  String userEmail;

  Login({
    required this.code,
    required this.status,
    required this.token,
    required this.userId,
    required this.userEmail,
  });

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      code: obj['code'] as int,
      status: obj['status'] as bool,
      token: obj['data']['token'] as String,
      userId: obj['data']['user']['id'] as int,
      userEmail: obj['data']['user']['email'] as String,
    );
  }
}
