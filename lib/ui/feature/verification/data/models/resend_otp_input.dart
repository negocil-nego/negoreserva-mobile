class ResendOtpInput {
  final String otpId;
  final String userId;

  ResendOtpInput({required this.otpId, required this.userId});

  Map<String, dynamic> toJson() => {
        'otpId': otpId,
        'userId': userId,
      };
}
