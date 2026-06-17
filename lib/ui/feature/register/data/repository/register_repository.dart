import 'package:mobile/data/models/create_account_response.dart';
import 'package:mobile/ui/feature/register/data/models/create_account_client_input.dart';

abstract class RegisterRepository {
  Future<CreateAccountResponse> createAccountClient(CreateAccountClientInput request);
}
