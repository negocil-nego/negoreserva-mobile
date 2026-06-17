import 'package:mobile/data/models/create_account_response.dart';
import 'package:mobile/ui/feature/register/data/models/create_account_client_input.dart';
import 'package:mobile/ui/feature/register/data/repository/register_repository.dart';

class RegisterService {
  final RegisterRepository _repository;

  RegisterService(this._repository);

  Future<CreateAccountResponse> createAccountClient(CreateAccountClientInput request) {
    return _repository.createAccountClient(request);
  }
}
