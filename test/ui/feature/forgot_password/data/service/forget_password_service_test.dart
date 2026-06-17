import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mobile/_import.dart';

class MockForgetPasswordRepository extends Mock
    implements ForgetPasswordRepository {}

void main() {
  group('ForgetPasswordService', () {
    late MockForgetPasswordRepository mockRepo;
    late ForgetPasswordService service;

    setUpAll(() {
      registerFallbackValue(ForgetPasswordRequest(input: ''));
    });

    setUp(() {
      mockRepo = MockForgetPasswordRepository();
      service = ForgetPasswordService(mockRepo);
    });

    test('sendMessageForgetPassword returns true', () async {
      when(() => mockRepo.sendMessageForgetPassword(any()))
          .thenAnswer((_) async => true);

      final request = ForgetPasswordRequest(input: 'test@email.com');
      final result = await service.sendMessageForgetPassword(request);

      expect(result, true);
    });

    test('sendMessageForgetPassword propagates exception', () async {
      when(() => mockRepo.sendMessageForgetPassword(any()))
          .thenThrow(GqlException('Erro'));

      final request = ForgetPasswordRequest(input: 'test@email.com');

      expect(
        () => service.sendMessageForgetPassword(request),
        throwsA(isA<GqlException>()),
      );
    });
  });
}
