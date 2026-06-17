import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/mock_gql_client.dart';

void main() {
  group('ResetPasswordGqlRepository', () {
    late MockGqlClient mockClient;
    late ResetPasswordGqlRepository repository;

    setUp(() {
      mockClient = MockGqlClient();
      repository = ResetPasswordGqlRepository(mockClient);
    });

    test('forgetResetPassword returns true on success', () async {
      mockClient.mockMutateResponse({'pubResetPassword': true});

      final request = ResetPasswordRequest(code: '123456', password: 'newpass123', confirm: 'newpass123');
      final result = await repository.forgetResetPassword(request);

      expect(result, true);
    });

    test('forgetResetPassword throws GqlException on error', () async {
      mockClient.mockMutateError('Código inválido');

      final request = ResetPasswordRequest(code: '000000', password: 'newpass123', confirm: 'newpass123');

      expect(
        () => repository.forgetResetPassword(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
