import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile/_import.dart';
import '../../../../../helpers/faker_data.dart';

class MockLoginRepository extends Mock implements LoginRepository {}

void main() {
  group('LoginService', () {
    late MockLoginRepository mockRepo;
    late LoginService service;

    setUpAll(() {
      registerFallbackValue(LoginRequest(username: '', password: ''));
    });

    setUp(() {
      mockRepo = MockLoginRepository();
      service = LoginService(mockRepo);
    });

    test('login returns UserAuthResponse', () async {
      final fakeResponse = fakeUserAuthResponse();
      when(() => mockRepo.login(any())).thenAnswer((_) async => fakeResponse);

      final request = LoginRequest(username: 'test@email.com', password: '123');
      final result = await service.login(request);

      expect(result.token, fakeResponse.token);
      expect(result.name, fakeResponse.name);
      expect(result.email, fakeResponse.email);
    });

    test('login propagates repository exception', () async {
      when(() => mockRepo.login(any())).thenThrow(GqlException('Erro'));

      final request = LoginRequest(username: 'test@email.com', password: '123');

      expect(
        () => service.login(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
