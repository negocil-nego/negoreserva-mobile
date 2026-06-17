import 'package:mobile/data/models/create_account_response.dart';
import 'package:mobile/data/models/user_auth_response.dart';
import 'package:mobile/ui/feature/verification/data/models/confirm_otp_input.dart';
import 'package:mobile/ui/feature/verification/data/models/resend_otp_input.dart';
import 'package:mobile/ui/feature/verification/data/repository/verification_repository.dart';

class VerificationService {
  final VerificationRepository _repository;

  VerificationService(this._repository);

  Future<UserAuthResponse> confirmOtp(ConfirmOtpInput request) {
    return _repository.confirmOtp(request);
  }

  Future<CreateAccountResponse> resendOtp(ResendOtpInput request) {
    return _repository.resendOtp(request);
  }
}
