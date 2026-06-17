import 'package:mobile/ui/feature/reset_password/data/models/reset_password_request.dart';
import 'package:mobile/ui/feature/reset_password/data/repository/reset_password_repository.dart';

class ResetPasswordService {
  final ResetPasswordRepository _repository;

  ResetPasswordService(this._repository);

  Future<bool> forgetResetPassword(ResetPasswordRequest request) {
    return _repository.forgetResetPassword(request);
  }
}
