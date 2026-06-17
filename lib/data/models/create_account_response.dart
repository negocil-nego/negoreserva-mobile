class CreateAccountResponse {
  final String otpId;
  final String userId;
  final String token;
  final String otpExpiredAt;
  final bool status;
  final String expiredAt;

  CreateAccountResponse({
    required this.otpId,
    required this.userId,
    required this.token,
    required this.otpExpiredAt,
    required this.status,
    required this.expiredAt,
  });

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccountResponse(
      otpId: json['otpId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      token: json['token'] as String? ?? '',
      otpExpiredAt: json['otpExpiredAt'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      expiredAt: json['expiredAt'] as String? ?? '',
    );
  }
}
