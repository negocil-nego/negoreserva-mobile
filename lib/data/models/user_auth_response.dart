class UserAuthResponse {
  final String token;
  final String name;
  final String email;
  final String type;
  final String status;
  final String logo;
  final String expiredAt;

  UserAuthResponse({
    required this.token,
    required this.name,
    required this.email,
    required this.type,
    required this.status,
    required this.logo,
    required this.expiredAt,
  });

  factory UserAuthResponse.fromJson(Map<String, dynamic> json) {
    return UserAuthResponse(
      token: json['token'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      type: json['type'] as String? ?? '',
      status: json['status'] as String? ?? '',
      logo: json['logo'] as String? ?? '',
      expiredAt: json['expiredAt'] as String? ?? '',
    );
  }
}
