import 'package:mobile/data/models/create_account_response.dart';
import 'package:mobile/data/models/user_auth_response.dart';
import 'package:mobile/ui/feature/verification/data/models/confirm_otp_input.dart';
import 'package:mobile/ui/feature/verification/data/models/resend_otp_input.dart';

abstract class VerificationRepository {
  Future<UserAuthResponse> confirmOtp(ConfirmOtpInput request);
  Future<CreateAccountResponse> resendOtp(ResendOtpInput request);
}
