import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/mock_gql_client.dart';

void main() {
  group('ForgetPasswordGqlRepository', () {
    late MockGqlClient mockClient;
    late ForgetPasswordGqlRepository repository;

    setUp(() {
      mockClient = MockGqlClient();
      repository = ForgetPasswordGqlRepository(mockClient);
    });

    test('sendMessageForgetPassword returns true on success', () async {
      mockClient.mockMutateResponse({'pubSendMessageForgetPassword': true});

      final request = ForgetPasswordRequest(input: 'test@email.com');
      final result = await repository.sendMessageForgetPassword(request);

      expect(result, true);
    });

    test('sendMessageForgetPassword throws GqlException on error', () async {
      mockClient.mockMutateError('Email não encontrado');

      final request = ForgetPasswordRequest(input: 'unknown@email.com');

      expect(
        () => repository.sendMessageForgetPassword(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
