import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/faker_data.dart';
import '../../../../../helpers/mock_gql_client.dart';

void main() {
  group('RegisterGqlRepository', () {
    late MockGqlClient mockClient;
    late RegisterGqlRepository repository;

    setUp(() {
      mockClient = MockGqlClient();
      repository = RegisterGqlRepository(mockClient);
    });

    test('createAccountClient returns CreateAccountResponse on success', () async {
      final fakeData = fakeCreateAccountJson();
      mockClient.mockMutateResponse({'pubCreateAccountClient': fakeData});

      final request = CreateAccountClientInput(
        name: 'João Silva',
        email: 'joao@email.com',
        phone: '+244923456789',
        password: '123456',
        confirm: '123456',
      );
      final result = await repository.createAccountClient(request);

      expect(result.otpId, fakeData['otpId']);
      expect(result.userId, fakeData['userId']);
      expect(result.status, true);
    });

    test('createAccountClient throws GqlException on error', () async {
      mockClient.mockMutateError('Erro ao criar conta');

      final request = CreateAccountClientInput(
        name: 'João Silva',
        email: 'joao@email.com',
        phone: '+244923456789',
        password: '123456',
        confirm: '123456',
      );

      expect(
        () => repository.createAccountClient(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
