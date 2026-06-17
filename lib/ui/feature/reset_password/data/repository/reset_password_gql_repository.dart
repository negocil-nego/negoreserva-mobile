import 'package:mobile/data/network/gql_client.dart';
import 'package:mobile/ui/feature/reset_password/data/models/reset_password_request.dart';
import 'package:mobile/ui/feature/reset_password/data/repository/reset_password_repository.dart';

class ResetPasswordGqlRepository implements ResetPasswordRepository {
  final GqlClient _client;

  ResetPasswordGqlRepository(this._client);

  @override
  Future<bool> forgetResetPassword(ResetPasswordRequest request) async {
    const query = '''
      mutation pubResetPassword(\$request: UserResetPasswordRequest!) {
        pubResetPassword(request: \$request)
      }
    ''';

    final response = await _client.mutate(query, variables: {'request': request.toJson()});

    return response.data!['pubResetPassword'] as bool;
  }
}
