class ConfirmOtpInput {
  final String otpId;
  final String code;

  ConfirmOtpInput({required this.otpId, required this.code});

  Map<String, dynamic> toJson() => {
        'otpId': otpId,
        'code': code,
      };
}
