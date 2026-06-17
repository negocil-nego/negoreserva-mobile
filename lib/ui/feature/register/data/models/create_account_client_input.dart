class CreateAccountClientInput {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String confirm;

  CreateAccountClientInput({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirm,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'confirm': confirm,
      };
}
