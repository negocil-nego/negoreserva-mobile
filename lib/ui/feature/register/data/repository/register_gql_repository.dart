import 'package:mobile/data/models/create_account_response.dart';
import 'package:mobile/data/network/gql_client.dart';
import 'package:mobile/ui/feature/register/data/models/create_account_client_input.dart';
import 'package:mobile/ui/feature/register/data/repository/register_repository.dart';

class RegisterGqlRepository implements RegisterRepository {
  final GqlClient _client;

  RegisterGqlRepository(this._client);

  @override
  Future<CreateAccountResponse> createAccountClient(CreateAccountClientInput request) async {
    const query = '''
      mutation pubCreateAccountClient(\$request: CreateAccountClientInput!) {
        pubCreateAccountClient(request: \$request) {
          otpId
          userId
          token
          otpExpiredAt
          status
          expiredAt
        }
      }
    ''';

    final response = await _client.mutate(query, variables: {'request': request.toJson()});

    final data = response.data!['pubCreateAccountClient'] as Map<String, dynamic>;
    return CreateAccountResponse.fromJson(data);
  }
}
