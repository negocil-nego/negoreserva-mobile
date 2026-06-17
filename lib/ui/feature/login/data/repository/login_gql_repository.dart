import 'package:mobile/data/models/user_auth_response.dart';
import 'package:mobile/data/network/gql_client.dart';
import 'package:mobile/ui/feature/login/data/models/login_request.dart';
import 'package:mobile/ui/feature/login/data/repository/login_repository.dart';

class LoginGqlRepository implements LoginRepository {
  final GqlClient _client;

  LoginGqlRepository(this._client);

  @override
  Future<UserAuthResponse> login(LoginRequest request) async {
    const query = '''
      mutation pubLogin(\$request: LoginRequest!) {
        pubLogin(request: \$request) {
          token
          name
          email
          type
          status
          logo
          expiredAt
        }
      }
    ''';

    final response = await _client.mutate(query, variables: {'request': request.toJson()});

    final data = response.data!['pubLogin'] as Map<String, dynamic>;
    return UserAuthResponse.fromJson(data);
  }
}
