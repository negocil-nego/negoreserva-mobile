import 'package:mobile/ui/feature/forgot_password/data/models/forget_password_request.dart';
import 'package:mobile/ui/feature/forgot_password/data/repository/forget_password_repository.dart';

class ForgetPasswordService {
  final ForgetPasswordRepository _repository;

  ForgetPasswordService(this._repository);

  Future<bool> sendMessageForgetPassword(ForgetPasswordRequest request) {
    return _repository.sendMessageForgetPassword(request);
  }
}
