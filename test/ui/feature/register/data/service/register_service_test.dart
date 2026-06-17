import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/faker_data.dart';

class MockRegisterRepository extends Mock implements RegisterRepository {}

void main() {
  group('RegisterService', () {
    late MockRegisterRepository mockRepo;
    late RegisterService service;

    setUpAll(() {
      registerFallbackValue(CreateAccountClientInput(
        name: '', email: '', phone: '', password: '', confirm: '',
      ));
    });

    setUp(() {
      mockRepo = MockRegisterRepository();
      service = RegisterService(mockRepo);
    });

    test('createAccountClient returns CreateAccountResponse', () async {
      final fakeResponse = fakeCreateAccountResponse();
      when(() => mockRepo.createAccountClient(any()))
          .thenAnswer((_) async => fakeResponse);

      final request = CreateAccountClientInput(
        name: 'João',
        email: 'joao@email.com',
        phone: '+244923456789',
        password: '123456',
        confirm: '123456',
      );
      final result = await service.createAccountClient(request);

      expect(result.otpId, fakeResponse.otpId);
      expect(result.status, true);
    });

    test('createAccountClient propagates repository exception', () async {
      when(() => mockRepo.createAccountClient(any()))
          .thenThrow(GqlException('Erro'));

      final request = CreateAccountClientInput(
        name: 'João',
        email: 'joao@email.com',
        phone: '+244923456789',
        password: '123456',
        confirm: '123456',
      );

      expect(
        () => service.createAccountClient(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
