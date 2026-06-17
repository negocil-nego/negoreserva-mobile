import 'package:mobile/ui/feature/forgot_password/data/models/forget_password_request.dart';

abstract class ForgetPasswordRepository {
  Future<bool> sendMessageForgetPassword(ForgetPasswordRequest request);
}
