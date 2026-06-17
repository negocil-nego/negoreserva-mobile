import 'package:mobile/data/models/user_auth_response.dart';
import 'package:mobile/ui/feature/login/data/models/login_request.dart';
import 'package:mobile/ui/feature/login/data/repository/login_repository.dart';

class LoginService {
  final LoginRepository _repository;

  LoginService(this._repository);

  Future<UserAuthResponse> login(LoginRequest request) {
    return _repository.login(request);
  }
}
