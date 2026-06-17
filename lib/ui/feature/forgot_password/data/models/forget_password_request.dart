class ForgetPasswordRequest {
  final String input;

  ForgetPasswordRequest({required this.input});

  Map<String, dynamic> toJson() => {'input': input};
}
