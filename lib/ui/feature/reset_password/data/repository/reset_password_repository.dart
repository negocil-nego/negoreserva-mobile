import 'package:mobile/ui/feature/reset_password/data/models/reset_password_request.dart';

abstract class ResetPasswordRepository {
  Future<bool> forgetResetPassword(ResetPasswordRequest request);
}
