import 'package:mobile/data/models/user_auth_response.dart';
import 'package:mobile/ui/feature/login/data/models/login_request.dart';

abstract class LoginRepository {
  Future<UserAuthResponse> login(LoginRequest request);
}
