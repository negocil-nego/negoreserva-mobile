import 'package:mobile/data/network/gql_client.dart';
import 'package:mobile/ui/feature/forgot_password/data/models/forget_password_request.dart';
import 'package:mobile/ui/feature/forgot_password/data/repository/forget_password_repository.dart';

class ForgetPasswordGqlRepository implements ForgetPasswordRepository {
  final GqlClient _client;

  ForgetPasswordGqlRepository(this._client);

  @override
  Future<bool> sendMessageForgetPassword(ForgetPasswordRequest request) async {
    const query = '''
      mutation pubSendMessageForgetPassword(\$request: UserForgetPasswordRequest!) {
        pubSendMessageForgetPassword(request: \$request)
      }
    ''';

    final response = await _client.mutate(query, variables: {'request': request.toJson()});

    return response.data!['pubSendMessageForgetPassword'] as bool;
  }
}
