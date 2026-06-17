class ResetPasswordRequest {
  final String code;
  final String password;
  final String confirm;

  ResetPasswordRequest({
    required this.code,
    required this.password,
    required this.confirm,
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'password': password,
        'confirm': confirm,
      };
}
