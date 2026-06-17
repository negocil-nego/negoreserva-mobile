import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/faker_data.dart';
import '../../../../../helpers/mock_gql_client.dart';

void main() {
  group('LoginGqlRepository', () {
    late MockGqlClient mockClient;
    late LoginGqlRepository repository;

    setUp(() {
      mockClient = MockGqlClient();
      repository = LoginGqlRepository(mockClient);
    });

    test('login returns UserAuthResponse on success', () async {
      final fakeData = fakeUserAuthJson();
      mockClient.mockMutateResponse({'pubLogin': fakeData});

      final request = LoginRequest(username: 'test@email.com', password: '123456');
      final result = await repository.login(request);

      expect(result.token, fakeData['token']);
      expect(result.name, fakeData['name']);
      expect(result.email, fakeData['email']);
    });

    test('login throws GqlException on error', () async {
      mockClient.mockMutateError('Erro de autenticação');

      final request = LoginRequest(username: 'test@email.com', password: 'wrong');

      expect(
        () => repository.login(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
